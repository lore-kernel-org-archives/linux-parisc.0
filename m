Return-Path: <soete.joel@tiscali.be>
Date: Wed, 4 Feb 2004 12:47:15 +0100
Message-ID: <400CB8A10000C95A@ocpmta3.freegates.net>
In-Reply-To: <8BF7471D09AA9B4190A9C96778BC2A1748D23C@qcaexc02.asiapacific.cpqcorp.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] UNable to boot the cd.
To: "AYAZ, MOHAMMED ASIF" <asifayaz@hp.com>,
	"Grant Grundler" <grundler@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Asif,

>I was right , as per the listings inthe  forum ! 
>When I try to search - the cd's doesnt get  seacrched as ipl device! 
>Secondly when i boot from the Main muenu all i get message is 
>Booting from device not ready....
 

>But the same device  works fine with HPUX OS cd.. 

For me that exclude cdrom driver pb ;)

And seems also that CD Creator can also write raw image by this method (I
have unfortunately no experience with this tool but I can check if cdrecord
exits for NT systems?).
So the last pb I can see is a pb of image corruption (during file transfer):

could you check the md5sum of your file
(if you don't have other linux box to do, on your XP you could install it
eg. with cygwin tools with <http://sources.redhat.com/cygwin/setup.exe> ;)


Cheers,
    Joel


-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
