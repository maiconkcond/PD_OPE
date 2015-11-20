var meuApp= angular.module('meuApp', ['ngResource']);




meuApp.controller('principal', function($scope, $resource, $http){

   

     //serviço
    var Itens=$resource("http://localhost:3000/api/itens_pedidos/:id", { id: '@_id' });
	  $scope.estoqueProd=Itens.query();
    
    //metodo que finaliza o serviço(pelo menos deveria)
     $scope.salva= function(i){
        alert("clicou no salva");
        
        Itens.save(i);
        

     }

    //teste
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
    $scope.estoqueProd.push({id: id, nome: nome, valor: valor, qtd: $scope.qtd});
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

