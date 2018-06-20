// JavaScript Document


function minus(ID) {
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
        // IE7+, Firefox, Chrome, Opera, Safari �����ִ�д���
        xmlhttp=new XMLHttpRequest();
    }
    else
    {
        // IE6, IE5 �����ִ�д���
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.open("GET","WEB-INF/jsp/admin/include/shoppingCart/minus.jsp?_ID="+ID,true);
    xmlhttp.send();
}

function adding(ID) {
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
        // IE7+, Firefox, Chrome, Opera, Safari �����ִ�д���
        xmlhttp=new XMLHttpRequest();
    }
    else
    {
        // IE6, IE5 �����ִ�д���
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.open("GET","WEB-INF/jsp/admin/include/shoppingCart/adding.jsp?_ID="+ID,true);
    xmlhttp.send();
}

/*�ı�������Ʒ������*/
function changeNum(numId,flag,ID){/*numId��ʾ��Ӧ��Ʒ�������ı���ID��flag��ʾ�����ӻ��Ǽ�����Ʒ������ID��ʾ�������ݿ�Ĳ���*/
	var numId=document.getElementById(numId);
	if(flag=="minus"){/*������Ʒ����*/
		if(numId.value<=1){
			alert("��Ʒ���������Ǵ���0");
			return false;
			}
		else{
            minus(ID);
			numId.value=parseInt(numId.value)-1;
			productCount();
			}
		}
	else{/*flagΪadd��������Ʒ����*/
        adding(ID);
		numId.value=parseInt(numId.value)+1;
		productCount();
		}
	}
	
/*�Զ�������Ʒ���ܽ��ܹ���ʡ�Ľ��ͻ���*/
function productCount(){
	var total=0;      //��Ʒ����ܼ�
	var integral=0;   //�ɻ���Ʒ����
	
	var point;      //ÿһ����Ʒ�ĵ�Ʒ����
	var price;     //ÿһ����Ʒ�ĵ���
	var number;    //ÿһ����Ʒ������
	var subtotal;  //ÿһ����Ʒ��С��

     /*����IDΪshopping��������е�����*/
	var myTableTr=document.getElementById("shopping").getElementsByTagName("tr"); 
	if(myTableTr.length>0){
	for(var i=1;i<myTableTr.length;i++){/*��1��ʼ����һ�еı��ⲻ����*/
	    if(myTableTr[i].getElementsByTagName("td").length>2){ //���һ�в�����
		point=myTableTr[i].getElementsByTagName("td")[3].innerHTML; 
		price=myTableTr[i].getElementsByTagName("td")[4].innerHTML;
		number=myTableTr[i].getElementsByTagName("td")[5].getElementsByTagName("input")[0].value;
		integral+=point*number;
		total+=price*number;
		myTableTr[i].getElementsByTagName("td")[6].innerHTML=price*number;
		}
	}
	document.getElementById("total").innerHTML=total;
	document.getElementById("integral").innerHTML=integral;
	
	}
}
window.onload=productCount;

/*��ѡ��ȫѡ��ȫ��ѡЧ��*/
function selectAll(){
	var oInput=document.getElementsByName("cartCheckBox");
 for (var i=0;i<oInput.length;i++){
 	    oInput[i].checked=document.getElementById("allCheckBox").checked;
	}
}
	
/*���ݵ�����ѡ���ѡ�����ȷ��ȫѡ��ѡ���Ƿ�ѡ��*/
function selectSingle(){
	var k=0;
	var oInput=document.getElementsByName("cartCheckBox");
	 for (var i=0;i<oInput.length;i++){
	   if(oInput[i].checked==false){
		  k=1;
		  break;
	    }
	}
	if(k==0){
		document.getElementById("allCheckBox").checked=true;
    }
	else{
		document.getElementById("allCheckBox").checked=false;
    }
}

/*ɾ��������Ʒ*/
function deleteRow(rowId,ID){
	var Index=document.getElementById(rowId).rowIndex; //��ȡ��ǰ�е�������
    deleteRowFromDB(ID);
	document.getElementById("shopping").deleteRow(Index);
	productCount();
}

/*ɾ��ѡ���е���Ʒ*/
function deleteSelectRow(){
	var oInput=document.getElementsByName("cartCheckBox");
	var Index;
	 for (var i=oInput.length-1;i>=0;i--){
	   if(oInput[i].checked==true){
		 Index=document.getElementById(oInput[i].value).rowIndex; /*��ȡѡ���е�������*/
		 document.getElementById("shopping").deleteRow(Index);
	    }
	}
	productCount();
}

function deleteRowFromDB (ID){
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
        // IE7+, Firefox, Chrome, Opera, Safari �����ִ�д���
        xmlhttp=new XMLHttpRequest();
    }
    else
    {
        // IE6, IE5 �����ִ�д���
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.open("GET","WEB-INF/jsp/admin/include/shoppingCart/delete.jsp?_ID="+ID,true);
    xmlhttp.send();
}

