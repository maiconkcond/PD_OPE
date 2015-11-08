var meuApp= angular.module('meuApp', []);

meuApp.controller('principal', function($scope){


	$scope.estoqueProd=[
     {nome:"agua", valor:30, qtd:2},
     {nome:"suco", valor:20, qtd:1},
	];



    $scope.$watchCollection('estoqueProd', function() {
        $scope.total = 0;
        angular.forEach($scope.estoqueProd, function (prod) {
            $scope.total += prod.qtd * prod.valor;
        });
    });
	   
    $scope.addProd= function(){
        
      
          $.ajax({ 
           type: "GET", 
           url: "http://localhost:3000/home/jsonValor/"+$scope.estoque,
           dataType: "json", 
           success: function(data){ 
               
                $scope.nome=data.nome;
                $scope.valor=data.valor_venda;
              	$scope.estoqueProd.push({nome: $scope.nome, valor: $scope.valor, qtd: $scope.qtd});
		    	$scope.estoque="";
		    	$scope.nome="";
		    	$scope.valor="";
		    	$scope.qtd="";
		    
            }

          });

    
    }
});


meuApp.controller('atualiza', function($scope, $interval){
   var c=0;
    $interval(function(){
       $scope.message="testando contagem para refresh da div = "+c;
      c++;
    },1000);
});