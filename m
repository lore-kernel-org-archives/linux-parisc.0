Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id E92CF4841
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Nov 2003 02:16:58 -0700 (MST)
Date: Mon, 10 Nov 2003 10:16:50 +0100
Message-ID: <3F969FFE00009CDD@ocpmta2.freegates.net>
In-Reply-To: <200311100525.hAA5Pg2V002251@hiauly1.hia.nrc.ca>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] fdisk problems 2.4 <-> 2.6
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>, tausq@debian.org
Cc: grundler@parisc-linux.org, willy@debian.org,
	parisc-linux@lists.parisc-linux.org
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

>-- Original Message --
>To: tausq@debian.org
>From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
>Cc: grundler@parisc-linux.org, soete.joel@tiscali.be,
>	willy@debian.org, parisc-linux@lists.parisc-linux.org
>Date: Mon, 10 Nov 2003 00:25:42 -0500 (EST)
>Subject: Re: [parisc-linux] fdisk problems 2.4 <-> 2.6
>
>
>> %R2 is not *wrong* -- it points to the right side of argument register

> 2 (jda explained this in an earlier thread), but I am not 100% sure 
> %R2 will do the right thing for a 32-bit build though -- if you are 
> running on a pa1.1 machine and 
>he register is only 32-bit, does %R2 
> automatically do the right thing with 64-bit arguments?  I guess it's 
> easy enough to tell by looking at the code gcc generates...

'R' simply adds 1 to the register number specified for operand 2.
This is
>the right thing to do for a DImode value running 32-bit code.
In the code that gcc generates, we use a specific set of register
pairs for long doubles (see HARD_REGNO_MODE_OK).  The main question
that I would have is is the register created in the a
>m consistent
with the register allocation needed for a DImode value.  I think it
would be if the mode/type for the input/output was specified
correctly.  This can be done with a cast in the asm.

Dave
-- 
J. David Anglin                         
>        dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-li
>ux.org/mailman/listinfo/parisc-linux



-------------------------------------------------------------------------
Tiscali ADSL: 3 mois GRATUITS! L'Internet rapide, c'est pour tout le monde.

http://reg.tiscali.be/default.asp?lg=fr
