Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id EA26F4843
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Jan 2004 07:52:36 -0700 (MST)
Date: Wed, 28 Jan 2004 15:52:33 +0100
Message-ID: <400CB8A1000068DD@ocpmta3.freegates.net>
In-Reply-To: <Pine.LNX.4.58.0401281500300.14924@jazz.he.fi>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] K380 partial success, the state of the port?
To: "Heikki Hannikainen" <hessu@hes.iki.fi>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello,

>- Should I go to the 2.6 tree? I compiled it from the CVS (to get the
>tulip driver working but the SCSI failed:
>
>Linux version 2.6.1-pa10 (root@soul) (gcc version 3.0.4) #2 SMP Tue Jan
27


Afaik, 2.6 is not yet smp ready. Could you re-test it by just removing SMP
(there are already a lot of improvement in 2.6  :) )

hth,
    Joel

PS: I am happy that boot fine on the N I am testing 

-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
