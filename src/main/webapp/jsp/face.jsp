<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>摄像头拍照</title>
  <%@ include file="common.jsp"%>
</head>
<body>
  <video id="video" width="480" height="320" controls>
  </video>
  <div>
    <button id="capture">拍照</button>
  </div>
  <canvas id="canvas" width="480" height="320"></canvas>
  <script>
    //访问用户媒体设备的兼容方法
    function getUserMedia(constraints, success, error) {
      if (navigator.mediaDevices.getUserMedia) {
        //最新的标准API
        navigator.mediaDevices.getUserMedia(constraints).then(success).catch(error);
      } else if (navigator.webkitGetUserMedia) {
        //webkit核心浏览器
        navigator.webkitGetUserMedia(constraints,success, error)
      } else if (navigator.mozGetUserMedia) {
        //firfox浏览器
        navigator.mozGetUserMedia(constraints, success, error);
      } else if (navigator.getUserMedia) {
        //旧版API
        navigator.getUserMedia(constraints, success, error);
      }
    }

    let video = document.getElementById('video');
    let canvas = document.getElementById('canvas');
    let context = canvas.getContext('2d');

    function success(stream) {
      //兼容webkit核心浏览器
      let CompatibleURL = window.URL || window.webkitURL;
      //将视频流设置为video元素的源
      console.log(stream);

      //video.src = CompatibleURL.createObjectURL(stream);
      video.srcObject = stream;
      video.play();
    }

    function error(error) {
      console.log('访问用户媒体设备失败${error.name}, ${error.message}');
    }

    if (navigator.mediaDevices.getUserMedia || navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia) {
      //调用用户媒体设备, 访问摄像头
      getUserMedia({video : {width: 480, height: 320}}, success, error);
    } else {
      alert('不支持访问用户媒体');
    }

   
    document.getElementById('capture').addEventListener('click', function () {
      context.drawImage(video, 0, 0, 480, 320);
      console.log(getBase64());
var ac='24.35b6a1db7a444deadcd33ecda428f6b0.2592000.1604044532.282335-22777199';
  /* 	$.ajax({
  		type:"post",
  		url:"https://aip.baidubce.com/rest/2.0/face/v3/match?access_token="+ac,
  		dataType:"json",
  		data:
  			[{
  		        "image":  getBase64() ,
  		        "image_type": "BASE64",
  		        "face_type": "LIVE",
  		        "quality_control": "LOW",
  		        "liveness_control": "HIGH"
  		    },
  		    {
  		        "image":  getBase64() ,
  		        "image_type": "BASE64",
  		        "face_type": "IDCARD",
  		        "quality_control": "LOW",
  		        "liveness_control": "HIGH"
  		    }]
  		,
  		success:function(data){
  			 console.log(data)
  		}
  	}) */
  	return false;
    })
    
    
    function getBase64() {
		var imgSrc = document.getElementById("canvas").toDataURL(
				"image/png");
		 
		return imgSrc.split("base64,")[1];
 
	};

  </script>
</body>
</html> 