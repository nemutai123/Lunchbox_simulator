<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.Recipe"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
<!-- Latest compiled JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<link rel="stylesheet" href="asset/owl/owl.carousel.min.css">
<link rel="stylesheet" href="asset/owl/owl.theme.default.min.css">
<script src="asset/owl/jquery.min.js"></script>
<script src="asset/owl/owl.carousel.min.js"></script>
<script src="asset/owl/owl.carousel.js"></script>
<script src="asset/owl/atuo.js"></script>

<link rel="stylesheet" type="text/css" href="asset/lunchboxloc.css">
<link rel="stylesheet" type="text/css" href="asset/mainstyle.css">





<style>
@import url(https://fonts.googleapis.com/css?family=BenchNine:700);

.snip1535 {
	background-color: #c47135;
	border: none;
	color: #ffffff;
	cursor: pointer;
	display: inline-block;
	font-family: 'BenchNine', Arial, sans-serif;
	font-size: 1em;
	font-size: 22px;
	line-height: 1em;
	margin: 15px 40px;
	outline: none;
	padding: 12px 40px 10px;
	position: relative;
	text-transform: uppercase;
	font-weight: 700;
}

.snip1535:before, .snip1535:after {
	border-color: transparent;
	-webkit-transition: all 0.25s;
	transition: all 0.25s;
	border-style: solid;
	border-width: 0;
	content: "";
	height: 24px;
	position: absolute;
	width: 24px;
}

.snip1535:before {
	border-color: #c47135;
	border-right-width: 2px;
	border-top-width: 2px;
	right: -5px;
	top: -5px;
}

.snip1535:after {
	border-bottom-width: 2px;
	border-color: #c47135;
	border-left-width: 2px;
	bottom: -5px;
	left: -5px;
}

.snip1535:hover, .snip1535.hover {
	background-color: #c47135;
}

.snip1535:hover:before, .snip1535.hover:before, .snip1535:hover:after,
	.snip1535.hover:after {
	height: 100%;
	width: 100%;
}
??



</style>

</head>
<body>
	
		<div id="con">
			<div id="main">
				<div id="dosirak">
					<div class="dosirak-row rf">
						<div id="first" class="s"></div>
						<div id="second" class="s"></div>
						<div id="third" class="s"></div>
					</div>
					<div class="dosirak-row rs">
						<div id="fourth" class="s"></div>
						<div id="fifth" class="s"></div>
					</div>
				</div>
				<button id="Lun_CompleteB" width = 40px>????????? ????????????</button>
			</div>		
		</div>
			
		<div id="lunName_area"></div>

		<div id="recipe_area"></div>

		<div class="search-box" id="search_model"></div>
	
		<div id="crawling_area"></div>





	<script>
//1.????????? ???????????? ???????????? ???????????? 2????????? ???????????? ????????? ???????????? ??? ??? ????????? ?????????????????? push
let CompleteR_Num_list = [];


let Result_method = "";
let Result_level = "";
let Result_time = "";



//2.???????????? ????????? ??????
let TempButton1 = document.querySelector("#first");
let TempButton2 = document.querySelector("#second");
let TempButton3 = document.querySelector("#third");
let TempButton4 = document.querySelector("#fourth");
let TempButton5 = document.querySelector("#fifth");


//2.5????????? ????????? ???
function search_Model(){
		
		
		//????????? ????????? ?????????//
		let ButtonId = this.id;
		let ButtonId_s = document.getElementById(`\${ButtonId}`);
		console.log(ButtonId)
		
		let ButtonId_Name = ButtonId.substr(11,11);
		
		//
		let SelectImg = "";
		
		//?????????????????? ?????? ?????? ??? ????????? ????????? ???????????????
		let User_Recipe = [];
		User_Recipe.push(ButtonId_Name);
		
		
		search_model.innerHTML = "";
        recipe_area.innerHTML = "";
        search_model.innerHTML = 
        					`<div class = "Serach_Model">
    
        						<input class="search-txt" type="text" placeholder="???????????? ????????? ?????????" id = "Input_Search">
                                	<div class = "Search_Type" id = "Search_Type_id">
                        				<button id = "Method">????????????</button>
                        					<div id = "method_area"></div>
                        					
                        				<button id = "Level">?????????</button>
                        					<div id = "level_area"></div>
                        					
                        				<button id = "Time">????????????</button>
                        					<div id = "time_area"></div>
                        					
                        			</div>
                        		<button class="search-btn" type="submit" id = 'searchbar' >??????</button>
                        		
                        		
                            </div>`;
        //???????????? , ???????????? , ????????? function ========================================        
       let method = document.getElementById("Method");
       let level = document.getElementById("Level");
       let time = document.getElementById("Time");
       

       
       
       
    
       function click_method(){
        	console.log("TRest")
        	method_area.innerHTML = `
        	<div>
        		
	        	  <label>
	        	    <input type="radio" name="metho" value="??????,??????,??????,??????" checked />
	        	    <span>??????,??????,??????,??????</span>
	        	    
	        	  </label>
	        	 
	        	  <label>
	        	    <input type="radio" name="metho" value="??????,??????,??????,??????" />
	        	    <span>??????,??????,??????,??????</span>
	        	  </label>
	        	  
	        	  <label>
	        	    <input type="radio" name="metho" value="?????????,???,?????????" />
	        	    <span>?????????,???,?????????</span>
	        	  </label>
	        	  
	        	  <label>
	        	    <input type="radio" name="metho" value="??????,??????" />
	        	    <span>??????,??????</span>
	        	  </label>
	        	  <button id = "Type_click1">??????</button>
        		
        	</div>`;
        	let value1 = $("input[type=radio][name=metho]:checked").val();
        	
        	document.getElementById('Type_click1').onclick = function() {
        	    var radios = document.getElementsByName('metho');
        	    for (var radio of radios)
        	    {
        	        if (radio.checked) {
        	            alert(radio.value);
        	            Result_method = radio.value; 
        	        }
        	    }
        	}//
        	
        	
        	
        }//click_method ????????? ============================================
        
        function click_level(){
        	level_area.innerHTML = `
            	<div>
            		
    	        	  <label>
    	        	    <input type="radio" name="leve" value="??????" checked />
    	        	    <span>??????</span>
    	        	  </label>
    	        	 
    	        	  <label>
    	        	    <input type="radio" name="leve" value="??????" />
    	        	    <span>??????</span>
    	        	  </label>
    	        	  
    	        	  <label>
    	        	    <input type="radio" name="leve" value="??????" />
    	        	    <span>??????</span>
    	        	  </label>
    	        	  <button id = "Type_click2">??????</button>
            	
            	</div>`;
            	
            	let value2 = $("input[type=radio][name=leve]:checked").val();
            	
            	document.getElementById('Type_click2').onclick = function() {
            	    var radios = document.getElementsByName('leve');
            	    for (var radio of radios)
            	    {
            	        if (radio.checked) {
            	            alert(radio.value);
            	            Result_level = radio.value; 
            	        }
            	    }
            	}//
       	 }
        
        function click_time(){
        	time_area.innerHTML = `
            	<div>
            	
    	        	  <label>
    	        	    <input type="radio" name="tim" value="10" checked />
    	        	    <span>10???</span>
    	        	  </label>
    	        	 
    	        	  <label>
    	        	    <input type="radio" name="tim" value="15" />
    	        	    <span>15???</span>
    	        	  </label>
    	        	  
    	        	  <label>
    	        	    <input type="radio" name="tim" value="30" />
    	        	    <span>30???</span>
    	        	  </label>
    	        	  
    	        	  <label>
	  	        	    <input type="radio" name="tim" value="60" />
	  	        	    <span>60???</span>
	  	        	  </label>
	  	        	  <button id = "Type_click3">??????</button>
            	
            	</div>`;
            	
            	let value3 = $("input[type=radio][name=tim]:checked").val();
            	
            	document.getElementById('Type_click3').onclick = function() {
            	    var radios = document.getElementsByName('tim');
            	    for (var radio of radios)
            	    {
            	        if (radio.checked) {
            	            alert(radio.value);
            	            Result_time = radio.value; 
            	       
            	           
            	            
            	            }
            	            
            	            
            	         
            	            
            	        }
            	    
            	}//
        }
        
        level.addEventListener("click",click_level);
        method.addEventListener("click",click_method);
        time.addEventListener("click",click_time);
        
      //???????????? , ???????????? , ????????? function ========================================  ===================================
        	
      
                            
                            
//jsquery//3.?????? ????????? 
let InputSearch = document.getElementById("Input_Search");
let SearchBar = document.getElementById("searchbar");

//===================================================================================================                  
    
    function search_click(){//search_click =========================================
    	console.log(Result_method) 
    	
/*     	if(type_list.length == 0){
    		type_list[0] = "null???";
    	}
    	if(type_list.length == 1){
    		type_list[1] = "null???2";
    	}
    	if(type_list.length == 2){
    		type_list[2] = "null???3";
    	}
 */

    	let num = []
    	let name = []
    	let ingredient = []
   		let recipe_method = []
    
    	let recipe_time = []
    	let recipe_difficulty = []
    	let recipe_detail = []
    	let recipe_img = []
    	let cooking_img = []
    
    	let calories = []
    	let protein = []
    	let carbohydrate = []
    	let fat = []
    	
      	
    	
    	
      		$.ajax({
      			
      			
    			url:"ajax.do",
    			dataType:"json",
    			contentType: "application/json",
    			data:{"Search" : InputSearch.value,
    				  "Method" : Result_method,
    				  "Level" : Result_level,
    				  "Time" : Result_time
    					
    				},
    			
    			success:function(data){
    				console.log("????????????");
    				console.log(data);
    				
    				for(let i = 0; i<data.length; i++){
    					
    					num.push(data[i].recipe_code),
    					name.push(data[i].recipe_name),
    					ingredient.push(data[i].ingredient),
    					recipe_method.push(data[i].recipe_method),
    					        

    					recipe_time.push(data[i].recipe_time),
    					recipe_difficulty.push(data[i].recipe_difficulty),
    					recipe_detail.push(data[i].recipe_detail),
    					recipe_img.push(data[i].recipe_img),
    					cooking_img.push(data[i].cooking_img),
    					        
    					calories.push(data[i].calories),
    					protein.push(data[i].protein),
    					carbohydrate.push(data[i].carbohydrate),
    					fat.push(data[i].fat)
                    }
    				
					let Recipe = {
							"Num" : num,
					        "Name" : name,
					        "Ingredient" : ingredient,
					        "Recipe_method" : recipe_method,
					        
					        "Recipe_time" : recipe_time,
					        "Recipe_difficulty" : recipe_difficulty,
					        "Recipe_detail" : recipe_detail,
					        "Recipe_img" : recipe_img,
					        "Cooking_img" : cooking_img,
					        
					        "Calories" : calories,
					    	"Protein" : protein,
					    	"Carbohydrate" : carbohydrate,
					        "Fat" : fat
			    	}
    				  
  
    				console.log("?????????");
    	    		console.log(Recipe);

    	      		
    	        search_model.innerHTML = null;
    	        let resultHTML =
    	            `<table border="1"> 
    	                <tr>
    	                    <th>?????? ?????????</th>
    	                    <th>?????? ??????</th>
    	                    <th>?????????</th>
    	                </tr>`;
    	        //????????? ???????????? ??? ???????????? ???????????? id??? ??????
    	////~~~~~~~~~~~~~~~check//
    	        for(let i = 0; i<Recipe.Num.length; i++){
    	            resultHTML += 
    	                `<tr>
    	                    <td><button><img src = "\${Recipe.Recipe_img[i]}" width = 200px height = 200px></button></td>
    	                    <td><button id = "\${Recipe.Num[i]}">\${Recipe.Name[i]}</button></td>
    	                    <td>\${Recipe.Recipe_difficulty[i]}</td>
    	                </tr>`;
    	        }
    	        resultHTML += `</table>`;
    	        recipe_area.innerHTML = resultHTML;

    	      //4.???????????? ????????? ???????????? ????????? ???????????? ????????? ??? ???????????? ????????? ????????? ??? ?????? ????????? ??????
    	      //Click_IDbutton
    	      function Click_Addbutton(i){ 
    	          let tmp = document.getElementById(`\${Recipe.Num[i]}`);
    	          tmp.addEventListener("click",recipe_click);
    	      }
  
    	      for(let i = 0; i<Recipe.Num.length; i++){
    	          Click_Addbutton(i);
    	      }

    	        function recipe_click(){//====================5.===============

    	            console.log(this.id);
    	            
    	        //5.????????? ???????????? ?????? ????????? ???????????? ??????
    	        let recipe_num = String(this.id);
    	        
    	        let Result_Html = "";
    	      
    	        for(let i = 0; i<Recipe.Num.length; i++){
    	            if(recipe_num == Recipe.Num[i]){
    	            //Cooking_img ?????????
					//Cooking_img??? Recipe_detail [,] split??????
						
						//???????????? ????????? ????????? ?????????
						SelectImg = Recipe.Recipe_img[i];
    	            
    	            	//???????????? ????????? ??????????????? User_Recipe??? push??????
    	      
    	            	User_Recipe.push(Recipe.Num[i])

						//replace ''??????
						let Temp_Cooking_img = Recipe.Cooking_img[i].replace(/\'/gi,"");
						
						
						//split (,)???????????? ??????
						Temp_Cooking_img = Temp_Cooking_img.split(",");
			
						//replace[ , ] ??????
						Temp_Cooking_img[0] = Temp_Cooking_img[0].replace("[","");
						Temp_Cooking_img[Temp_Cooking_img.length-1] = Temp_Cooking_img[Temp_Cooking_img.length-1].replace("]","");
						
						
					//Recipe_detail ?????????
						//(',)??? ???????????? split
						let Temp_Recipe_detail = Recipe.Recipe_detail[i].split("\',");
						
						//] , [ ??????
						Temp_Recipe_detail[0] = Temp_Recipe_detail[0].replace("[","");
						Temp_Recipe_detail[Temp_Recipe_detail.length-1] = Temp_Recipe_detail[Temp_Recipe_detail.length-1].replace("]","");
						
						
					//Ingredient ?????????
						let Temp_Ingrident = Recipe.Ingredient[i];
						
						//Temp_Ingrident = Temp_Ingrident.split("|");
						//Temp_Ingrident[0] = Temp_Ingrident[0].substr(5,Temp_Ingrident[0].length-1);

						//[string](????????? ????????????) --> |??? ?????????
						let Check1 = 100;
						let Check2 = 100;
						for(let k = 0; k<Temp_Ingrident.length; k++){
								if(Temp_Ingrident[k] == "["){
									Check1 = k;
									console.log("?????? 111" + Temp_Ingrident[k]);
									console.log("?????? Check : " + Check1);
									
								}
								if(Temp_Ingrident[k] == "]"){
									
									Check2 = k; 
									console.log("?????? 222" + Temp_Ingrident[k])	
									console.log("?????? Check : " + Check2);
									console.log(Temp_Ingrident,Check1,Check2);
										
									let changeStr = Temp_Ingrident.substring(Check1,Check2+1);
										
									Temp_Ingrident = Temp_Ingrident.replace(changeStr,"|"); 
									console.log("?????? : ");
									console.log(Temp_Ingrident);
										
								}
								
						}
						
						let changeStr2 = Temp_Ingrident.substring(0,2);
						Temp_Ingrident = Temp_Ingrident.replace(changeStr2,"");
						
						Temp_Ingrident = Temp_Ingrident.split("|"); 	//Split(ingrident?????????)
						
	                   	//5-1. ???????????? ????????? ?????? ??????????????? crawling_area ????????? ??????
	                    let Ingrident_Html = "";
	                    for(let i = 0; i<5; i++){
	                    	if(Temp_Ingrident[i] != null){
	                       		Ingrident_Html += 
	                    	   `<a href= "javascript:crawling('\${Temp_Ingrident[i]}')">\${Temp_Ingrident[i]}	</a>`
	                    	}
	                     };
	                     
						//5-2. ???????????? ????????? ?????? ?????????, ?????? ??????,????????? ?????? 
    	                for(let i = 0; i<Temp_Cooking_img.length; i++){
    	                	//??????????????? ??????
    	                	Temp_Recipe_detail[i] = Temp_Recipe_detail[i].replace(/\'/gi,"");
    	                	
    	                    Result_Html +=                          
    	                      `<tr>
    	                          <td><img src = "\${Temp_Cooking_img[i]}" width = "100px" height = "100px"></td> 
    	                          <td colspan = 3>\${Temp_Recipe_detail[i]}</td> 
    	                      </tr>`

    	                };

    	                recipe_area.innerHTML = 
    	                  `<table border = 1>
    	                      <tr>
    	                          <td colspan = 3> \${ButtonId_Name}?????? ????????? </td>
    	                      </tr>
    	                      <tr>
    	                          <td colspan = 2><img src = "\${Recipe.Recipe_img[i]}" width = 300px height = 200px></td>
    	                          <td colspan = 2>
    	                          \${"????????? : "+Recipe.Calories[i] +" ????????? : "+Recipe.Protein[i] + " ???????????? : "+Recipe.Carbohydrate[i] + " ????????? : "+Recipe.Fat[i]}
    	                          <br>
    	                          
    	                          </td>  
    	                      </tr>
							<tr>
								<td colspan = 4>
    	      				  \${Ingrident_Html}
    	      				  	<td>
    	      				</tr>
    	      				
    	                      \${Result_Html}
    	                      <tr>
    	                          <td><button id = "Go_Back">????????????</button></td>
    	                          <td><button id = "Search_Price">????????? ??????</button></td> 
    	                          <td colspan = "2" align = "center"><button id = "Select_Complete">?????? ??????</button></td>   
    	                      </tr>
    	                  </table>`
    	            }
    	    }//for???
    	    
    	    //5-3. ???????????? ???????????? ????????? ????????? ??????
    	    let SelectComplete = document.getElementById("Select_Complete");
    	   
    	
    	    function Select_complete(){
    	    	
    	    	recipe_area.innerHTML = "";
    	    	crawling_area.innerHTML = "";
    	    	
    	    	ButtonId_s.innerHTML = `<img src = "\${SelectImg}" width = 50px height = 50px>`;
    	    	alert("????????????!!");
    	    	CompleteR_Num_list.push(5);
    	    	
    	    	console.log("????????? ?????? ?????? ?????? : "+CompleteR_Num_list.length);
    	    	
    	    	
    	         $.ajax({//ajax_Send_lbseqCon.do
    	        	 
    	          	url : "ajax_Send_lbseqCon.do",
    	          	dataType:"json",
    	          	contentType: "application/json",
    	          	success : function(data){ // success=========================
    	          		
    	          		console.log(data)
    	          		
    	 	          	$.ajax({
        	          		url : "ajax_LunchSuB.do",
        	    	        dataType:"json",
        	    	        contentType: "application/json",
        	    	        data:{"Seq" : User_Recipe[0] , "Num" : User_Recipe[1] ,"LunchBox_seq" : data},
        	          		
        	    	        
        	          	});
    	          	//7 ????????? ???????????? ????????? ?????? ???????????? ??????
    	   	        let LunCompleteB = document.querySelector("#Lun_CompleteB");
    	   	         //????????? ??????
    	   	         function CompeteR_Click() {
    	   	         	if(CompleteR_Num_list.length >= 2){
    	   	         		
    	   	         		//tbl_lunchbox_detail???????????? ???????????? tbl_lunchbox??? ????????????
    	   	         		lunName_area.innerHTML = 
    	   	         			`<label>????????? ?????? : </label>
    	   						 <input type = "text" id = "Lunchbox_Name">
    	   						 <button type = "button" id = "Lunchbox_Name_button">??????</button>`;
    	   	         		//???????????? ????????? ????????? ????????? lun_name????????? ????????? ?????? 
    	   	         		
    	   	         		let NameButton = document.getElementById("Lunchbox_Name_button");
    	   	         		
    	   	         		NameButton.addEventListener('click',function(){
    	   	         			let LunchboxName = document.getElementById("Lunchbox_Name");
    	   	         			let lun_name = LunchboxName.value;
    	   	         			alert("????????????")
    	   	         			location.href = "GoLunchResult.do";
	    	   	         		$.ajax({
	    	   						url : "ajax_Insert_CompleteLB.do",
	            	    	        dataType:"json",
	            	    	        contentType: "application/json",
	            	    	        data:{"LunchBox_seq" : data , "Lunchbox_name" : lun_name},
	    	   						
	    	   					});	 
    	   	         		})
    	   	         
    	   					
    	   	         			
    	   	         	}
    	   	         	else {
    	   	         		alert("2??? ?????? ?????? ??????~");
    	   	         	}
    	   	         }
    	   	         
    	   	         LunCompleteB.addEventListener("click",CompeteR_Click);
    	   	         
    	          	}//success===============================
   					
    	          	
    	         });//ajax_Send_lbseqCon.do
    	    }
    	  
    	    SelectComplete.addEventListener("click",Select_complete);
    	    
    	    //6.???????????? ???????????? ????????? ????????? ????????? ?????? ?????? ??????
    	    let Goback = document.getElementById("Go_Back");
    		
    	    function GoBack(){
    	    	
    	       recipe_area.innerHTML = resultHTML;
    	       crawling_area.empty();
    	       for(let i = 0; i<Recipe.Num.length; i++){
    	           Click_Addbutton(i);
    	        }
    	    }
    	    
    	    Goback.addEventListener("click",GoBack);
    	    
    	}//=========================== 5.=========================
    				
                    
    },
  });
    

}//search_click() ========================================= search_click =========================================
    SearchBar.addEventListener("click",search_click);
    
}

TempButton1.addEventListener("click",search_Model);
TempButton2.addEventListener("click",search_Model);
TempButton3.addEventListener("click",search_Model);
TempButton4.addEventListener("click",search_Model);
TempButton5.addEventListener("click",search_Model);


function crawling(search){
	console.log("==????????? ??????==")
	
	$.ajax({
		url : 'http://59.3.58.53:3750/crawling',
		type : 'post',
		data : {
			'search' : search
		},
		success : function(res){
			result = res.sort(function(a,b) {	
								return Number(a.price.replace()) - Number(b.price);
							});
			
			let Crawling_Html_Sub = "";
			console.log(result);
			
			for(let i = 0; i<result.length; i++){
				Crawling_Html_Sub += `<tr>
										<td>\${result[i].name}</td>
										<td>\${result[i].price}</td>
									 </tr>`;
			};
			
			crawling_area.innerHTML = `<table border = 1>
											<tr>
												<td>??????</td>
												<td>??????</td>
											</tr>
											\${Crawling_Html_Sub}
										</table>`;
			
			
			
			//result.name x 
			//result.price x
			
	
		},
			error : function(e){
			console.log(e)
		}
	})
	
}

</script>
</body>
</html>