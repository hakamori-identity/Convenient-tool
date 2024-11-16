<!DOCTYPE html><html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="content-style-type" content="text/css">
    <title>迅速URL訪問tororo</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 20px;
            text-align: center;
        }

        .search-box {
            margin-bottom: 20px;
        }

        input[type="text"] {
            width: 400px;
            padding: 10px;
            font-size: 1.2rem;
            border: 2px solid #ddd;
            border-radius: 5px;
        }

        button {
            padding: 10px 20px;
            font-size: 1.2rem;
            background-color: #4285f4;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #357ae8;
        }

        .loading-message {
            font-size: 1.2rem;
            color: #ff9900;
            font-weight: bold;
        }

        .error-message {
            font-size: 1.2rem;
            color: #ff0000;
            font-weight: bold;
        }

        iframe {
            margin: 10px 0;
            border: 1px solid #ccc;
            width: 100%;
            height: 600px;
        }
    </style>
</head>
<body>

    <h1>迅速URL訪問tororo</h1>

    <div class="search-box">
        <input type="text" name="urlInput" id="urlInput" placeholder="URLをここに入力" />
        <button onclick="visitURL()">訪問</button>
    </div>

    <div class="loading-message" id="loadingMessage" style="display:none;">Now loading...</div>
    <div class="error-message" id="errorMessage" style="display:none;">リンクが間違っていませんか？</div>

    <div id="m_dvMado">
    </div>

    <script type="text/javascript">
        function visitURL() {
            var url = document.getElementById("urlInput").value;

            if (url == "") {
                alert("URLを入力してください！");
                return;
            }

            //URLチェック
            if (!url.startsWith("http://") && !url.startsWith("https://")) {
                alert("URLはhttp://またはhttps://から始まる必要があります！");
                return;
            }

            // lm
            document.getElementById("loadingMessage").style.display = "block";
            document.getElementById("errorMessage").style.display = "none";

            var iframeContainer = document.getElementById("m_dvMado");

            while (iframeContainer.firstChild) {
                iframeContainer.removeChild(iframeContainer.firstChild);
            }

            var iframe = document.createElement('iframe');
            iframe.setAttribute("src", url);
            iframe.setAttribute("title", "訪問したページ");
            iframe.style.border = "1px solid #ddd";

            iframe.onload = function() {
                document.getElementById("loadingMessage").style.display = "none";
            };

            iframe.onerror = function() {
                document.getElementById("loadingMessage").style.display = "none";
                document.getElementById("errorMessage").style.display = "block";
            };

            iframeContainer.appendChild(iframe);
        }
    </script>



</body>
</html>
