Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF988327BFA;
	Tue, 18 Aug 2026 09:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787046428; cv=none; b=QRSfdTIrYzMnui774qdywavd0vkYonm866bHlnpLWSO7/B2tx0Bx+8fts/60DQcI9Sx448O7hp0VzpUUSzTJpykjFWRHY4grxttjufxn4jY7+PZxQ+5vugBEWRBIsGm+eQuSfL5+5228OuWP6ACukWBJ98DL6MY3oE/n5Flh/K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787046428; c=relaxed/simple;
	bh=Tj4yWRVyyTFv4ZVXXReDQpx7jgTdu22C5BzOB0JzV68=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=H6i33s20wjEnDT6OOMHGs1WqlF16s9f2vt/LMh3VZFiX/5IBJohq1P1Rc/dOC6oF9EdeZaXgArYqB5Eo/tNQVSqVGqzGDckJg0rToFmv/x1fQ+jXYbQujNmq3y7gXD/5RSDw8xtdVpdZrxobGiQrLhOnVE+/ZHnsTJqeI5q9s8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=jlLndzqv; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="jlLndzqv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1787046415; x=1787651215; i=deller@gmx.de;
	bh=qXchaRQrbLW7lziiTUC6VPhAZr97hE7dGAvF3KqJ+2w=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=jlLndzqvXDrlGSuXUjnHPebOZ6klOk+OnnLfSqSl8d8hV+hICnsSwBu+seD8BfI7
	 ZDW2PevMGydRSNzYOS5JUCu/RcSZskj6B82UeK3/fClLpb38ZUgg7lGxNvNr/DYx4
	 BnA1tNdLGlzCfKvE+NRHx4EciFp8UQwLqNr/I9k2dwXeam0yeeeF/qQyjXpA1koGE
	 1Tn2yEgOMj5mfJrL+pCSz8m+fqByq+YIqSCDtBrv3/OhTwrXLK91KIFRRdZt9WnXM
	 3sdcIWC0LU3crP7uHOPgxCMs3koLiP2JFQa+gC4xqu5Omngaq30T8F4glnSfBpRHi
	 p8YW2tq7ERVavuqJ8A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7sDg-1x1EDs3LWM-00G977; Tue, 18
 Aug 2026 11:46:54 +0200
Message-ID: <afa004cd-3228-49e4-87e9-93eb4bc47db7@gmx.de>
Date: Tue, 18 Aug 2026 11:46:52 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] parisc: eisa: Fix infinite loop when parsing invalid IRQ
 value
To: Pei Xiao <xiaopei01@kylinos.cn>, James.Bottomley@HansenPartnership.com,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <53b759a86aafd200d7477675a77a0fae9dbf188f.1786937310.git.xiaopei01@kylinos.cn>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <53b759a86aafd200d7477675a77a0fae9dbf188f.1786937310.git.xiaopei01@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XXVtXfkpwsbs/iizLPqZsJZa2pS4PpWt8SvsFfAA5XTfnl1RC+l
 ui5/em02zbfixDRDOCppiqbzltsgCUB7ylWND8ecgqikUby23E2Q92l2lncDw+8ID8iFrYY
 x5NcBtA1iyXlVQeLGB9uxU7BDlehJ1ewPwqhdInneB+8lrFBMrqpfPuyj+NKTuKEVTWwK4a
 m/GyuQXWp3C2zTl6iScGA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FFGeJurgeCU=;0/ZFytCkcJCLWGh249Lhx3LZtkU
 X69S+ciUFwFbAqPVwRiSXgpcevSHViQtgdv8uXsSFrSXTd4ZjNLdkR2TJI3k8fiZLlqDMoAzD
 Fz+cg9HJBkV8q5kSFdBHzvGVR0jrpaHihg7h7MgNhSHtd/M63YIwl5LPRjmamMsoawmR+dnoX
 9WYR5upKEK68nDgau2mnFW+ZLXI2YrsL0LdoRWCu0rTp9ViOEwpUX3v+eqkQDDChjf/rUuKrL
 6DaVcZNYIM/zNeCmmtUFShJdmGoInPA6PFvq3twG/yleQLppA3KhWEZIRjt1dnBWtYNFtkjyR
 efPHBpwdkIh3Y4MmJXJlfvuADNr1y6G0FAjN95uddDqt50GABiEXYjn4i6rv1YdAA+7ard6Xz
 8U4AM6mAAL6JlahfjXY1V3adqX1s0jpEi9AIJCOiXzGJu2JFJyVy3ryaNFdfR1jFGqmCaDM7l
 rSFBTUv3hCdctFlr3vauII5+4gglNpwyR8nA/1JV5zC+YcmOMBiRNO1e6toS8mte8uSP3wxgE
 3hF6K6oIPQzSh7MjFWqDIKaFynPLsu3iPmXggtRRwDKupXSzAhlPSqq/b/4Ng4SLKARq7C4Ma
 /QIh/krGrrH6aqZFcVLxDxw4Hqu5xruxpGQAyJUracsKNbQh5fMB1Rbt+3oNXoje6fZUaEtOE
 RADFgA2l89uqFi2WEDpfBsRPq4FyvQVmHdTdncdwK9pDHTYDQQJ9ag07m6cojICZqK9UdVANQ
 ZsxN70MhKk2vO+0WGGhTbCdO9oUWj2QBJfjL1bQmUV/uwUlqwMYmBVK5cb5Fk0rvyn6qnjNL5
 QKKWtFCMxp+XOWR88mBmju7QYf9UMn5GHHtN4zPqPy3w1Yd5zXaIpYyok684WP7f/gfo4EukA
 WYmAlw1XcZk4LN7ozXYRsjgjpKpueXXjQnU2dJcrpHchnhn4aBrmSJbXapKBsPvA1f7BMLKSq
 dssQYSP2HI7B5C+LmekyjxXiXNwb6HACZZJ/G0P+TdL61bVi8rKqsWJXTu/a7cMhraBKQ/d/w
 FyLtzXC7zo5PuitG+vlKO9LibQG4inFpJ/Loku7JePBm2I6LcLGhLj0qhWMyml8JzIBqtAPVe
 /8RjZARUT9EHZ5NRLyU5xeqeh5O/HUcOrH6IR0ZMzBVWXLWX0A1zvIzD3bDHAI46czFyEXNAU
 SUXzLTPDFlmcY9aHnYyBUx5F5zyX+QByrHSjXORn+8itdY7MkikTlCyEFvvCn6y0KPCkVPHZj
 DOrBeCpEVpCLQh1Z5Ou/bFhaQhLpQZ+9LlI4Fmg1knVh+yVXU1vS0aV4zvJpVAcVY7mrZTol3
 do+DXyZbCAc0p5PwbDr6z/AD1ls571Jd0TGLl729NSZfhV775WKOwG1us/Z581S/nnooI3jFl
 0aF8RaEid9Szt4IQAC460dNk4tSeIaHHHV4IMYuiLuLvwe/zErAfjoU86B+2BgcvMXMx+7zgP
 C2FERamC+CxBLPno4sIc5/olraJZUAgJ2CSbVHeppHleRQ5mmPF6BUHw0kgaDnO9kHXp7kwoc
 FEJxAnHN86MYFBwociimyTbbh+SKq3hll1wYgGWu2Iw8MzFnIrL0cfUEK7klzWU7bobSuVWbk
 e5w+aZOdt25LsTr2xolhgdGeuFznlB2UsqMe8si4fOGyzLtz7Ffws0ZMQvMPNTm+d6AwKCPnx
 y+LqMc5sxc6j2gMhEsYHuNTUPytlGPcpRDHKgeJui92vJdVM5n+EjQ916C59iBe2Rj53o808w
 XpO2VHhdaO1SPn77+5OKnD6+XZIvA2PUbC6cIfkCvdne5R+5+zTudjFB73felYHQkhUEeNd+u
 6TxsbPN/Flms0ij2FXsjO3KsDiiyZF1BW/t6Y18ydyMs1uX88hC/5RphTr1Uy59Sqt9KYmRZE
 m/jT2NLI7CTh+lYK1EB+QmTbkQap6bKlkamJ6825QHAcNxRgSe3MzPJLw7fXiI1TtPYOhV9+x
 ZwFC1hRzDS5wFSPqPTRW5B9EFuDoBTvxIYbzer2MA4c7QZMBJxNyray1tIEWgAk2eDwHnHiY4
 QRosEq8y0ZMDtpiA6FBsSyqZEy8rxWUwUNvXl2zUxMU1ztF/JGF2QslTDAbcRYyTaBNJeIaSZ
 gnYvXjzosf2b7qWtZ6i4M8/aTU9IgDhxDC+QyAgJ2dJI4vQ4FO6JQoti91PU0lQoXDgQ6Q5Yw
 R3PxhD8GoKZ1L5UptM4W8m8l06LrN6kdChW/VhGUJF3mI8YTkRMzKS6SlQlOJCCPub3mQcDyG
 fFqiOz2eRKvetWaAR6sDsnbxiuBhCJZXhd3MNLGpSV1LV98Wk2W0B35bbCNjSnyQ0iK/UEOSz
 bM2lwNwU3UcmaAVLcuAsaNpEu6FYcryk549wXntS5D+o/O5NBiKAqS56GrXPxmKVXp7CxWqFX
 7TLs3fZvn4ewJg06Ul32l9GZ4HopWOt8BXuturQyTfijxm3rUn8J9mUlTBD9Zm+Tn0ABTFn5v
 rCO/YLXUg9lqy/UW0215h2exQhPW+rdjbYig/yh5VNp3Yvm+TQ/B19wyXco4gC+SveDKCbIkW
 z9K9RhFrSgNAu426BO/Evr7HZFNrOfGjn06ocLBEQsCWiwj8O8swH/CWgWwwKHsKWcJiII8z5
 ulXLA2+oiUhNRheCeozQuFYWD0ALyTU8L2fEy8wL/Jf9zgwmI1KpRKPQrWFq0w10jZlRx1WNO
 Ryp44OW0gh2Hj7Jgwym140GD+d+skKamliZaNLn+gjXtywyBkMAujtk12HHd7M3xlMm6LJIZC
 9SND+3WVkqTvLpscv643xDMQTRJVrRPd6bdqV+a5kFdhduu/Kg6PU1gcxVWEa4oM8ms0Etp4N
 AJCeBZqQgu4ZtBp5wYcdy9v8PlQ5UPn0ALJvBbFvSfkOoeWuagF1pVmQO8LK6/Y6fATj9rboB
 dFYF428yWdWuHatfbXf7Z5L336Cfkn9FEeeQqtbaSgar+jZufe9mYzNhI4TB9p3YloRMqLce/
 PL+g5MZQyAShQ3mqnPucyoHsXTqnv1BqpuC/4EiwnZbuG5ym/L2oG/SY4sch0FwbRnqtfJsSd
 Ywl9I7k0dvhFn/uTFh4fJQHq+Wvq3n88Pb2Qjs/fp9P/aPA90piMxEyi2m7o/UUPD9g9sTMbz
 zIIJoSrb7q6PUtYz/t4QIFWEGEEnbPQXIQRwSfLFND5ro0b97wgtKvOPZNtbfiGmyyrtu2jax
 yOXufZnfgK2P35KqEzoSiRLDWVTfUxOH/RP9Sgg3LhRwwCCm40eWZZ8NVLpGfp24vfT0YE/MZ
 eFb76NY3JpBSWpIC2P/MjuXZdjLHKVB1381xPl1SFBSNFWYlKeQzdQWakaNddpWk3S+L+4/9O
 VjONK+LnDCFIYGe+9iguD0LiG4/gPVXcK6MgF4hoKXjgLJqokCJJdTs9WRoldgnA6LbumdOB2
 uqvv1vABea8LaTXqhbcyUEvtBBbgVkGJUM57ZdrEPGqmyu/xzVSKsVpFwB13QQL3UMRrTnuv6
 RlyD8RoBpREwZ8wUdc3lhL9bt14X8xQZaRXeER72o96+fLaL8jmOEMGVX6mx70qBdC1xJ9vkW
 QuOetGppvbs90/W10u4ZUwNzz8aj7wj1QUsZeFikdVE/G0qJKz8B0k48o0lsV1GafLzQF63Fh
 PWrzUtX5R20qjDoxPCORCXIhrWURg7k3SWgOFzeTA+ABBYpVeM00xiC+7DVAx4HRtZcLjBonf
 YD0ixzFoArOoWjQYMIL/5RUimVWUZb0kqX9ERa7ibpCdCaZxVnHcbTF29WnELAJvnaB6nc5am
 oR/zG/o92gzH5Ifw8Fttzv4E9gvJWQCJzOI2caCQJ79wWGFqG5hQjAMuleWw/byu1B3dqjnQd
 EXa6APQI+ty3jHL90o1343cpcT4zB1xixKDfqnRxsP6yCpxHCyrdIw6EMuPFClaG/LwE230qy
 bIHDPtBKuOBd6f6XmF+Et6QsKF8C2yaMPjdS0+8VhYqF79dejhdd8V2cdClVfvVD9DIuC87aa
 sjTUerj4EZLZrwlVtJ3231d9Z9QOlFtDX/M8k6VqsrkVwI+SqKYnYorlCf6UCqr3mbePWpVgS
 f7aL9FTqz5D86lAfsFUqPqAF/OrAhau3r5OJt+qARVxoo6iDdcjvQ1/0qMyIZ4q4Q1E18qPfS
 ETc04KiME273+7sQjpLunUhL2TGND6bZe5Hz7UtB8MT6LfDC3cA2T3P6bF/vO+jGW1HuK6CGR
 oujbDqavl5RqauJFklSiawidoobudWpGGTikFnSKbZVZqHQt6rOJ/+S8EDo3W09KM7swgcWOI
 Yvsl7xBKIfv91P81aHWJsVkrLds3uIDoTJ2qG2xjIL5TsSNed3EZHAlUi0hEf5YNyGyYePx4l
 De7eT7TLLF/+dLU6EUHiQQRxBiHSIlf40Oq11fddIie02h+ibtYZw2NrLRKQaZUtjCaU24kyW
 yrZuQlXE+30Xtjfg4nh8q/2yCFeLsw77Bu/sWsWj+ijaPz2IEYKHn/7Bvv3leTq8ZsWYAdojq
 LMWnyXHyeh+o32CmBTXCt3sB3mnZI0sF4EjCNoYu2Cl/QQb5VCiBzgqDDQ6wguCBW5ellWcMQ
 /ks6iE+4TkE/mQinQFywHcELIhlN5C6V2lsbqsQUaUvVOk+ndyBL88UHbiUn0D+6Vx/wEFee/
 GkbX4BFmvuT8gkRBlpFVIZtgbkmuJmSJmA3AyYz0PNB5JovZ4SKxNKBw3YMK7ae0uQ3P1jB9s
 KucM6mkjtkon22xPi8onxG92F3o2/ZyB5o2UW515SIHy06pwUU4YB/J1I24KLUcZwMOMRzXu7
 eLXZ23nZwBy6Q32NJgZp/tYRDODmwqy4MocsxncTGz3r/PGEoRL3eoL1jWvi8l9wFAtIkN7sJ
 W2L23C9exJSc0ZbUG6HN9d8xz2ziKLcV4Mpz2v10uZtwMbLxXkJvVACzI36e8AheMS8Y8E0GE
 15V3Dn4Vd5ge7z6XP0a1o1ylnvPvYmVym72gfQjMgLwwZfmR7ef3cJ2v7iAmFFtuDEApdRW0k
 pXgnrPm3yql2H/2lXTtVxByMC1Y4bSbdt5xG5WWxR627Dm1ROwlIFg/03lxOdQj7EoTtXY+Vk
 PAC94ua3lLtaIXyC5f0s3k6I7pZ9yp6RPEJIV3zl0zPcm6e1PLJJ7aEzB15K72QEA1C539uBV
 9515st3pIbB9n9SpMpPHfmAAXWgM/kAmS87KjWcsgw+FxRQvzfH1dNltZZ1eR8Hiq1AoG0M8u
 +k/oHK8zuUtmJpWnb/jxxqeZ2aTXxpVWftJHFB3pRnsdehsd9dMBmyO0icJLFL6128gl3fhqV
 r6k+G4q1gQGJqHZv9t3CNyXyhhj8pEdP/sC+8lN6eoEIRLwMZhJVSfgKDRgsAA9Zsobb2YHaY
 Ihu1Y8FrttqcAKN9zCYf9Je9jW0Li9IpLJCkoa8hiQcyDsa+kWvfTYc9UFUFYXdBf0dXWNJ/+
 fPnv+ePOMm52L6KF4o00QvxGxDG1DSikbyk+3ucW4IwFUH1cQip3bb3bWKn1t+CvT27NNAtHX
 wOvDkGqD7858FjiXTAGSL+aYQJAT4/Vl1xT0cB1G0Kus9ePJIRLjX71ttE58dr7Dw48F4Eav8
 SrfUb+kJIxY9ScHV1pQs0qV3NlAErvk/6BAHXbRuMcO+hLh3ttddsNv8Z2Mo5FXbtoWB1dMl6
 RkfpgK6yRUrLSu191qD+hi78L1HJHhUOTxC8+ne/nxKflaCm8QXEfED2/8tMqp1FDTh8Ib7jY
 2QdphH/P8gHMvYgCkCmzjFUkrMUUtT7MrrYFY7Xm/+afw4qGZKElC7Ak/gQP6YaOxiihV2R6c
 HDllnRZeb+uAFRzZpkePT7rIm5GWg3jx2e9SZLCpQDDueA+22JsNsFyKmHh/Nm43/YbGAZws9
 fcIbdCIah5dyVQTK+Xf6C8IQYIk9WT5kVys9vPZuNms2l+n/HDAuL/6BrIk0hohReEDkqC5LX
 YV2Lw4HXIp/a70w0XbYIO2ZyZSgNPMtOUVGbc86rTOilXe5EklsuCe/nVi+XNYvX8H1fAj/lQ
 BdJXX4A/e2CJRtMbIVn25jvgXMAP9u/WQm6EsNzqib9WLZyLQiJG5y0/WoZODJEtuxP5/qQmL
 usdPXh/UoA2WlDT/qGpCZJiv1KxzFu1q/FbMRU6xYN1QEiXrLIrlOsp3kHG1knkXkfW7polqk
 XK0iiw9+TTBUiUQolOyys1EJvKDgMBmUpVCo4BkIjq8F+LV8bLnhlaWlrkx6mB6jUFincBzAM
 721ZKdFA4Dr3uIz6sxWAF7hQdEEVHycqU9dMyIDCsoqC0xgizkfr8QG5skzXoTAuVeLGaKHrv
 FcytOKq9nRI+7qP+KFwG7P2UhtcoFKZoHmzAOf18vdMkPW+Ivp/W/kwJzdMVUQ1id9+JLsMVg
 E6GVcMoTFd89VMWHUNodpMygwYMt5UGhKQEmziPCwsrl15UYrmx8cTZovok4y2XueFjUTZakf
 zb31+DYDfsIB6XMrmMPndgaY+OVN/6FFmYCUNjpISRqo6M0=

On 8/17/26 05:29, Pei Xiao wrote:
> When an invalid value is passed via the "eisa_irq_edge=3D" kernel
> command line parameter (e.g. "eisa_irq_edge=3D16,5"), eisa_irq_setup()
> prints an error message and continues without advancing the current
> position.  As a result the same invalid value is parsed again and
> again, causing an infinite loop while the kernel boots.
>=20
> Advance to the next comma-separated entry, or stop parsing when there
> is no next entry, before continuing so that the remaining entries are
> processed normally.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>   drivers/parisc/eisa.c | 5 +++++
>   1 file changed, 5 insertions(+)
applied.

Thanks!
Helge
