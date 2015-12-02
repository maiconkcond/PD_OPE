var meuApp= angular.module('meuApp', ['ngResource', 'ngSanitize']);





meuApp.controller('principal', function($scope, $resource, $http){

   

     //serviço
    var Itens=$resource("http://localhost:3000/api/itens_pedidos/:id", { id: '@_id' });
    var pedidoJson=$resource("http://localhost:3000/api/pedidos/:id", null, {
                                                      'update': { method:'PUT', params: {id:"@id"}}
                                                    });
    var estoqueJson=$resource("http://localhost:3000/api/estoques/:id", null, {
                                                      'update': { method:'PUT', params: {id:"@id"}}
                                                    });
    var caixaJson=$resource("http://localhost:3000/api/caixas/:id", null, {
                                                      'update': { method:'PUT', params: {id:"@id"}}
                                                    });
     var insumosJson=$resource("http://localhost:3000/api/insumos/:id", null, {
                                                      'update': { method:'PUT', params: {id:"@id"}}
                                                    });

    // array dos itens
	  $scope.estoqueProd=[];
    
    //eclui o pedido 
   $scope.ngExclui= function(id){
       $scope.pedId= pedidoJson.get({id:id}, function(data){
                console.log(id);
              
                 data.$remove({id:id});
                 //$location.path('http://localhost:3000/home')
                 location.reload(); 

            }); 
    }

     //passa para produção
    $scope.ngStatus= function(id){
  
            pedidoJson.get({id:id}, function(data){
                 data.status=2;
                 data.$update({id:id});
                
                   location.reload(); 
            }); 
   }
   
   //passa para entrega 
   $scope.ngStatus2= function(id){
 
            pedidoJson.get({id:id}, function(data){
                 data.status=3;
                 data.$update({id:id});
                
                   location.reload(); 
            }); 
   }

   //zera insumo por id
   $scope.zeraInsumoId= function(id){
    
       $scope.insumoId= insumosJson.get({id:id}, function(data){
                console.log(id);
                 data.quantidade=0;
                 data.$update({id:id});
                

            }); 
   }
    
  //zera todos os insumos
   $scope.zeraInsumoAll= function(){

       $scope.insumoId= insumosJson.query(function(data){
                

                 for(var i=0 ; i < data.length ; i++){
                     data[i].quantidade=0;
                     data[i].$update({id:data[i].id});
                 };

            }); 
   }


    //metodo que soma no caixa
    $scope.somaCaixa= function(){
            alert("soma");
               // Now call update passing in the ID first then the object you are updating
            $scope.caixaId= caixaJson.get({id:1}, function(data){
                console.log($scope.caixaId);
                 data.soma_geral=data.soma_geral+10;
                 data.$update({id:1});

            });

            
    }

     $scope.salva= function(){
        alert("clicou no salva");
               
        //pega o id do cliente
        var id = $("#client_id").val();
        //cria o json cm os dados e salva o pedido
        $scope.pedidoDados={client_id: id, status:1};
        pedidoJson.save({ pedido: $scope.pedidoDados, function() {
              
        } });


             pedidoJson.query(function(data){
                     var lastid= data.length - 1;
                     $scope.lastPedido=data[lastid].id;

                    
                      //for que salva os itens
                     for(var i=0 ; i < $scope.estoqueProd.length ; i++){

                           console.log($scope.lastPedido);
                        $scope.itens_pedido={estoque_id: $scope.estoqueProd[i].estoque_id, pedido_id: $scope.lastPedido, quantidade:$scope.estoqueProd[i].qtd};
                     
                        Itens.save({ itens_pedido: $scope.itens_pedido, function() {
                         // Optional function. Clear html form, redirect or whatever.
                         } });

                     }
                   
              });                                    
             
          window.location.href = "/home"; 
     }

    //calcula os valores dos itens
    $scope.$watchCollection('estoqueProd', function() {
        $scope.total = 0;
        angular.forEach($scope.estoqueProd, function (prod) {
            $scope.total += prod.qtd * prod.valor;
        });
    });
	   
    //tira do lista 
    $scope.excluir= function(index){
       $scope.estoqueProd.splice(index, 1);
      
    }
 
  

    //adiciona na lista
    $scope.addProd= function(){
        var nome = $("#estoque option:selected").text();
        var id = $("#estoque option:selected").val();
        var valor = $("#valor").val();
    $scope.estoqueProd.push({estoque_id: id, nome: nome, valor: valor, qtd: $scope.qtd});
          $scope.estoque="";
          $scope.nome="";
          $scope.valor="";
          $scope.qtd="";
    }

   

});

// novo controle de teste para refresh na página
meuApp.controller('atualiza', function($scope, $interval, $sce, $resource){
   var c=0;
    $scope.currentTime1 = new Date();
    
    var pedidoJson=$resource("http://localhost:3000/api/pedidos/:id", { id: '@_id' });

    $interval(function(){
       
       $scope.currentTime2 = new Date();
       var sobra=$scope.currentTime2 - $scope.currentTime1;

       console.log(sobra);
       if( sobra > 10000 ){
         $scope.passou = $sce.trustAsHtml("<i>masi de 1 minuto</i>");
       }
    
        

        pedidoJson.query(function(data){
          var tamanho= data.length;
          for(var i=0 ; i < tamanho ; i++){
              console.log(data[i]);
              var id=data[i].id;
              var a=angular.element("<div class='itensPedido2'>Nome do cliente<br/>endereço : Endereço<br/><div class='iconsPedido'><a href='http://localhost:3000' ng-click='ngExclui("+data[i].id+")''>Excluir</a><a href='../listar/"+data[i].id+"'><img width='25' height='25' alt='lista de itens' src='/assets/list-77659a3c97309a1e78e471bf8774e6731d6804dd252763692953c7c44a432c7b.png'></a><a href='../status'><img width='25' height='25' alt='lista de itens' src='/assets/seta-f8434d04f6ad94829f3a79887ca4f4f26199ef7ff43f62bc067732b64e6eeff9.png'></a></div></div>");
              //$('#tab1').append(a);
             
          } 
        });
      
       //$scope.div = $sce.trustAsHtml("<div class='itensPedido2'>Nome do cliente<br/>endereço : Endereço<br/><div class='iconsPedido'><a href='http://localhost:3000' ng-click='ngExclui()''>Excluir</a><a href='../listar/'><img width='25' height='25' alt='lista de itens' src='/assets/list-77659a3c97309a1e78e471bf8774e6731d6804dd252763692953c7c44a432c7b.png'></a><a href='../status'><img width='25' height='25' alt='lista de itens' src='/assets/seta-f8434d04f6ad94829f3a79887ca4f4f26199ef7ff43f62bc067732b64e6eeff9.png'></a></div></div>");
        $scope.teste=$sce.trustAsHtml("<img width='25' height='25' alt='lista de itens' src='/assets/seta-f8434d04f6ad94829f3a79887ca4f4f26199ef7ff43f62bc067732b64e6eeff9.png'>");

    },1000);
});

