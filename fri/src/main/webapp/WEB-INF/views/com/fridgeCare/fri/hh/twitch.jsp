<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/w3-css/4.1.0/w3.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"></script>
<style type="text/css">
#leftdiv {
	width:25%;
}
#rightdiv {
	width:75%;
}
</style>
</head>
<body class="w3-center">
	<a href="/fri" class="w3-btn w3-left w3-blue">Home</a>
	<div class="w3-content w3-padding">
		<div class="w3-left w3-red" id="leftdiv">
			<a href="/fri/hh/joinpage.fri">인증</a>
		</div>
		<div id="rightdiv" class="w3-left w3-padding">
			<h1>인증</h1>
			<h2>소개</h2>
			<div>이 가이드는 어떻게 트위치 인증을 사용하는지 소개함으로서 당신의 앱이 트위치계정을 대신하여 작업하거나 특정유저의 데이타에 접근가능할수있게 해줍니다</div>
			<div>권장하는 인증방법은 오아쓰 입니다</div>
			<div>우리는 오아쓰2.0 프로토콜을 활용합니다</div>
			<br>
			<div>오아쓰뿐만 아니라,트위치는 보다 안전한 오아쓰의 흐름을 위해  오픈아이디 연결을 제공합니다</div>
			<div>오픈아이디 연결토큰은 오픈아이디 연결 약관을 준수하는 서비스와 호환됩니다. 예를 들면 아마존에서 만든 '코그니토' 처럼요</div>
			<br>
			<div>인증에는 다음과 같은 일들이 포함됩니다</div>
			<div>1. 당신의 앱을 등록함으로서 클라 아이디와 비밀번호를 받습니다</div>
			<div>2. 토큰을 받습니다. 이 토큰은 지정된 범위가 있으며 승인을 받기위해 당신의 앱이 요구됩니다</div>
			<div>3. api 요청시 토큰을 보내서 당신의 요청이 유효함을 증명합니다</div>
			<br>
			<div><a href="https://github.com/twitchdev/authentication-node-sample">코드 예제</a></div>
			<br>
			<div>경고 : 당신의 토큰을 비번처럼 간수하세요. 예를 들어, 그 어떤 공공url에서도 토큰을 사용하지 말고 그 어떤 웹에서도 토큰을 노출하지 마세요</div>
			<br>
			<h2>요청 타당화</h2>
			<div>만약 당신이 로그인 목적으로만 트위치 인증을 사용하는 경우, 액세스토큰은 주기적으로 검증절차가 진행됩니다. 한번 발급된 오아쓰토큰의 주기적검증으로 당신의 앱을 승인한 유저가 연결이 해제되는 일이 없게됩니다</div>
			<br>
			<div>트위치 API를 활용하기 위해서 먼저 접근토큰의 유효성을 검증해야 합니다, 가장 최근의 검증으로부터 한시간이 넘었다면요</div>
			<br>
			<div>트위치는 주기적으로 유효성검사를 실시합니다. 만약 접근토큰이 검증되지 않은 앱이 발견되면(예를 들어 로그인검증 이후로 검증하지않은 앱), 우리는 이 사실을 알리고 개발자들과 협동해 해당이슈를 해결합니다. 만약 이슈를 해결하지 못하면, 개발자의 api키를 회수하거나 요청을 제한하는 강제적 조치를 취합니다 </div>
			<br>
			<div>오아쓰 접근토큰의 작동방식과 최종사용자의 오아쓰 세션의 기능에 대한 만족스러운 기능제공을 위해 검증은 반드시 필요합니다. 예를들어, 당신의 앱 사용자는 트위치 계정설정에서 당신의 앱 연결을 해제할수 있습니다. 앱 사용자가 앱과의 연결을 종료하면, 앱과 사용자간의 모든 오아쓰 토큰은 재검증이 필요해집니다. 그렇게 된다면, 오아쓰 토큰들의 연계는 타 시스템세션으로 옮겨질것으로 예상됩니다; 따라서 연결이 끊긴 사용자와 해당 서비스 간의 기존 세션도 무효화되어야 합니다</div>
			<br>
			<div>각 요청을 검증시, 요청의 헤더에 첨부된 오아쓰 토큰과 함께  요청이 검증서버에 제출됩니다. 요청자의 검증이 완료되면, 응답에 토큰상태가 포함됩니다. 성공적으로 요청응답절차가 진행되면 토큰상태를 통해 검증여부를 확인할수 있습니다</div>
			<br>
			<div>요청 예시 :</div>
			<br>
			<div class="w3-light-gray w3-padding">curl -H "Authorization: OAuth {access token}" https://id.twitch.tv/oauth2/validate</div>
			<br>
			<div>응답 예시 :</div>
			<br>
			<div class="w3-light-gray w3-padding">{
			  "client_id": "wbmytr93xzw8zbg0p1izqyzzc5mbiz",
			  "login": "twitchdev",
			  "scopes": [
			    "channel:read:subscriptions"
			  ],
			  "user_id": "141981764",
			  "expires_in": 5520838
			}
			</div>
			<br>
			<h2>등록</h2>
			<div>Twitch API를 사용하는 애플리케이션을 만들려면, 먼저 <a href="https://dev.twitch.tv/console/apps/create">트위치 개발자 사이트</a>에서 당신의 앱을 등록해야합니다. 앱을 만들때, 사용자가 인증완료후 리다이렉트될 URI를 넣으세요. 예를 들어 여러 환경에 동일한 클라이언트를 사용하려는 경우 여러 리디렉션 URI를 제공할 수 있습니다</div>
			<br>
			<div>개발자 응용프로그램을 만들면 클라이언트 ID가 할당됩니다. 클라 ID가 표시되는 페이지에서 클라 시크릿을 생성할수있는데 이 시크릿은 일부 인증절차에 요구됩니다</div>
			<br>
			<div>● 클라ID는 공개적이며 공유돼도 괜찮습니다 (예를 들어 클라ID는 웹 소스에 하드코딩해도 됩니다)</div>
			<br>
			<div>● 클라시크릿은 앱의 암호의 역할이며 절대로 공유, 유출되어선 안됩니다. 어떠한 방식으로도 다른 사용자에게 노출하지 마세요</div>
			<br>
			<div>클라 시크릿은 기밀사항이기에 페이지를 나간후에는 다시 표시하지 않으므로, 안전한곳에 기록해둘수 있도록 하세요. 또한 새 클라이언트 암호를 생성하면 현재 암호가 즉시 무효화되므로 앱이 업데이트될 때까지 API 요청이 실패할 수 있습니다</div>
			<br>
			<div style="font-style:oblique">경고 : 클라이언트 ID는 각 응용 프로그램에 대해 고유해야 합니다. 여러 응용 프로그램에 걸쳐 클라이언트 ID를 재사용하지 마십시오. 또한 응용 프로그램은 대상 API에 적합한 범위를 요청해야 합니다. 이러한 지침을 준수하지 않을 경우 응용 프로그램의 Twitch API 액세스가 중단될 수 있습니다</div>
			<br>
			<h2>토큰의 유형</h2>
			<div>Twitch는 다음과 같은 여러 유형의 토큰을 지원합니다</div>
			<br>
			<div>ID 토큰 (OIDC) : 최종사용자의 요청집합에 대한 특정 권한입니다. OIDC ID 토큰(JWT)을 사용하면 특정 인증에 대한 사용자(예: 이메일 주소)에 대한 세부 정보를 얻을 수 있습니다. 이러한 세부정보는 ID토큰에 탑재된 요청에 표시됩니다</div>
			<br>
			<div>NAT의 검색 끝점은 https://id.twitch.tv/oauth2/.knowled/openid-configuration입니다. 이는 AWS Cognito와 같은 표준 OIDC 클라이언트와 함께 사용할 수 있습니다</div>
			<br>
			<div>사용자 접근 토큰 : 사용자를 인증하고 앱이 사용자를 대신하여 요청할 수 있도록 허용합니다. 당신의 앱이 트위치계정을 필요로 하거나 인증된 유저의 정보에 관한 요청을 하는 경우, 사용자 접근 토큰을 생성할 필요가 있습니다</div>
			<br>
			<div>앱 접근 토큰 : 앱을 인증하고 그 앱이 가진 리소스에 접근할수 있게 합니다. 앱 액세스 토큰은 사용자와 연결되지 않으므로 사용자 인증이 필요한 엔드포인트에서는 사용할 수 없습니다</div>
			<br>
			<div>일부 Twitch API 끝점에는 사용자 인증이 아닌 애플리케이션 인증이 필요합니다. 프로그램에서 이러한 엔드포인트를 사용하는 경우 앱 액세스 토큰을 생성해야 합니다. 앱 액세스 토큰은 사용자 자격 증명이 아닌 클라이언트 자격 증명을 가져옵니다. 이를 통해 특정사용자가 당신을 대신하여 보안api요청을 할수 없게 됩니다. 클라이언트 자격 증명을 클라이언트 ID 헤더 대신 사용하여 응용프로그램을 안전하게 식별할 수도 있습니다</div>
			<br>
			<div>앱 액세스 토큰은 약 60일 후에 만료되므로 검증 엔드포인트에 요청을 제출하여 앱 액세스 토큰이 유효한지 확인해야 합니다(요청 타당화 참조). 토큰이 만료된 경우 새 토큰을 생성합니다</div>
			<br>
			<div style="font-style:oblique">앱 액세스 토큰은 서버 간 API 요청에만 사용되므로 클라이언트 코드에 포함해서는 안 됩니다</div>
			<br>
			<div>사용자 액세스 토큰과 앱 액세스 토큰은 모두 베어러 토큰입니다. Bearer 는 인증 헤더에 사용됩니다; 사용자 액세스 및 앱 액세스 토큰 전송을 참조하십시오</div>
			<br>
			<h2>토큰 얻기</h2>
			<div>트위치 인증 전용 도메인은 https://id.twitch.tv. 입니다</div>
			<br>
			<div>참고 : https://api.twitch.tv/kraken 을 https://id.twitch.tv. 로 대체하도록 URL이 업데이트되었습니다. 트위치 인증을 위해 기존 크라켄 도메인을 사용하는 코드는 트위치 API v.5 기능이 제거될 때까지 계속 작동합니다. 트위치 API v.5는 현재 더 이상 사용되지 않습니다 (역자 : 즉 이제 크라켄 도메인은 안쓴다는 뜻 같네요)</div>
			<br>
			<div>우리는 다음과 같은 몇 가지 인증 절차를 지원합니다</div>
			<br>
			<div>(해당부분은 중요하지 않아 번역하지 않습니다)</div>
			<br>
			<h2>토큰 전달</h2>
			<div>API 요청에 인증이 필요한 경우 액세스 토큰을 헤더로 보냅니다</div>
			<br>
			<div>예시 :</div>
			<div style="background-color:#F1EBFF">curl -H "Authorization: Bearer {access token}" https://api.twitch.tv/helix/</div>
			<br>
			<div>(이후의 내용은 번역하지 않습니다)</div>
		</div>
	</div>
	<div style="clear:both" class="w3-gray w3-padding">해당 페이지는 위대한 파파고의 번역능력을 기반으로 하였읍니다</div>
</body>
</html>