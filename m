Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 22010482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jul 2003 02:26:57 -0600 (MDT)
Date: Fri, 11 Jul 2003 10:26:53 +0200
Message-ID: <3F0BEA830000084F@ocpmta1.freegates.net>
In-Reply-To: <20030711065156.GA17025@dsl2.external.hp.com>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] warning: minor abi change
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi Grant,

>Joel,
>I haven't verified I got everything committed that you
>needed. Please let me know (via p-l mailing list) what
>else is outstanding.

For me it is Ok: i run this on b2k in 32bits mode (+ NS driver built in),
on a N4000 (UP because of mm pb: here I don't know what to do). I successfully
stress all them a bit by rebuilding kernel (still have to check some userspace
check) :)

Thanks a lot for help,
    Joel

PS1: btw, the previous parisc stuff transmitted to Alan are finaly included
in 2.4.22-pre4, I will so try to prepare asap a small update :)

PS2: Also for future 2.4.22, in binfmt_som.c '#error "Fix security hole before
enabling me"' (line 216). Do you have any idea to fix it?

------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
