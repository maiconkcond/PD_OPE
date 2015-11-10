var meuApp= angular.module('meuApp', []);

meuApp.controller('principal', function($scope){


	$scope.estoqueProd=[];



    $scope.$watchCollection('estoqueProd', function() {
        $scope.total = 0;
        angular.forEach($scope.estoqueProd, function (prod) {
            $scope.total += prod.qtd * prod.valor;
        });
    });
	   
    $scope.addProd= function(){
        var nome = $("#estoque option:selected").text();
        var valor = $("#valor").val();
  
    $scope.estoqueProd.push({nome: nome, valor: valor, qtd: $scope.qtd});
    $scope.estoque="";
          $scope.nome="";
          $scope.valor="";
          $scope.qtd="";
    }
});


meuApp.controller('atualiza', function($scope, $interval){
   var c=0;
    $interval(function(){
       $scope.message="testando contagem para refresh da div = "+c;
      c++;
    },1000);
});