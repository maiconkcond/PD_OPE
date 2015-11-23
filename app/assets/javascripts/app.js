var meuApp= angular.module('meuApp', ['ngResource']);




meuApp.controller('principal', function($scope, $resource, $http){

   

     //serviço
    var Itens=$resource("http://localhost:3000/api/itens_pedidos/:id", { id: '@_id' });
    var pedidoJson=$resource("http://localhost:3000/api/pedidos/:id", { id: '@_id' });

    // array dos itens
	  $scope.estoqueProd=[];
    
    //metodo que finaliza o serviço(pelo menos deveria)
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
meuApp.controller('atualiza', function($scope, $interval){
   var c=0;
    $interval(function(){
       $scope.message="testando contagem para refresh da div = "+c;
      c++;
    },1000);
});

