var meuApp= angular.module('meuApp', ["ngResource"]);

meuApp.factory( "Prod" , function ($resource){ 
     return $resource("" , 
         null, {
          enviar: { method: "post", url: "", headers: {content-type: "application/x-www-form-urlencoder"}}
         }
         
     ) ; 
 } ) ; 


meuApp.controller('principal', function($scope, $http,  $location, $resource, Prod){

   



	  $scope.estoqueProd=[];



    $scope.$watchCollection('estoqueProd', function() {
        $scope.total = 0;
        angular.forEach($scope.estoqueProd, function (prod) {
            $scope.total += prod.qtd * prod.valor;
        });
    });
	   

    $scope.excluir= function(index){
       $scope.estoqueProd.splice(index, 1);
      
    }
 
   


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

   
  

   $scope.salva= function(){
       alert("funcionou");
       $scope.enviar= function(){
           var enviar= $.params({"enviado": JSON.springify($scope.estoqueProd=[])})
           Prod.enviar(enviar);
    }
  }

});


meuApp.controller('atualiza', function($scope, $interval){
   var c=0;
    $interval(function(){
       $scope.message="testando contagem para refresh da div = "+c;
      c++;
    },1000);
});