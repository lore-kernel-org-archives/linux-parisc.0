From: "Rolf Eike Beer" <eike-kernel@sf-tec.de>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Wed, 16 May 2012 13:57:50 +0200
Message-ID: <2e923666713a6289672b48e9fa620f3b.squirrel@webmail.sf-mail.de>
References: <4FA9975C.5060708@bergerie>
    <41786065.U2qKzXR3uX@donald.sf-tec.de> <4FAA9382.7040802@bell.net>
    <4FAADE2A.9080803@bergerie>
    <BLU0-SMTP65CF901B170B044925E85897160@phx.gbl>
    <4FAEE943.2030203@gmx.de>
    <BLU0-SMTP93504AF1AF0414C90D1EFB971A0@phx.gbl>
    <4FB182F8.2040403@gmx.de>
    <BLU0-SMTP728EA90F4400504B2AF7A4971A0@phx.gbl>
    <1337069366.3005.10.camel@dabdike.lan>
    <1337073212.3005.12.camel@dabdike.lan> <4FB29F13.5070801@bell.net>
    <4FB2A58A.9050706@gmx.de> <4FB2AD78.1020002@bell.net>
    <4FB2B2A2.2020207@bell.net> <4FB2B5B1.7000604@gmx.de>
    <4FB2B71B.7090602@bell.net> <4FB2BC5F.3080905@gmx.de>
    <1337153257.2985.3.camel@dabdike.int.hansenpartnership.com>
    <BLU0-SMTP33D40958DB8FE0DF238A7197180@phx.gbl>
    <1337165857.2985.36.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "John David Anglin" <dave.anglin@bell.net>,
	"Helge Deller" <deller@gmx.de>,
	"Vincent" <vincent.stehle@laposte.net>,
	linux-parisc@vger.kernel.org
To: "James Bottomley" <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1337165857.2985.36.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> As pointed out by serveral people, PA1.1 only has a type 26 instruction
> meaning that the space register must be explicitly encoded.  Not giving an
> explicit space means that the compiler uses the type 24 version which is
> PA2.0
> only resulting in an illegal instruction crash.

> +	/* fic only has the type 24 form on PA1.1, requiring an
> +	 * explicit space specification, so use %sr4 */

Once you say 2.0 and once 1.1, I assume the latter is a typo?

Eike
