Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id D117D4840
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 10 Feb 2004 09:46:14 -0700 (MST)
Date: Tue, 10 Feb 2004 17:46:08 +0100
Message-ID: <4028678600000AEF@ocpmta1.freegates.net>
In-Reply-To: <401530610000B6EA@ocpmta1.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] glibc-2.3.3 & gcc-snapshot (3.5.0) pb
To: "James Morrison" <ja2morri@csclub.uwaterloo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

 
After some more hack I reach to this pb:
/Develop/parisc-linux/build/glibc/elf/ld.so.1: undefined reference to `set_dp'
collect2: ld returned 1 exit status
make[2]: *** [/Develop/parisc-linux/build/glibc/iconv/iconvconfig] Error
1
make[2]: Leaving directory `/Develop/parisc-linux/src/glibc-2.3.3-20040209/iconv'
make[1]: *** [iconv/others] Error 2
make[1]: Leaving directory `/Develop/parisc-linux/src/glibc-2.3.3-20040209'
make: *** [all] Error 2

and set_dp only appears in sysdeps/hppa/dl-machine.h

Any idea?

Thanks,
   Joel

-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
