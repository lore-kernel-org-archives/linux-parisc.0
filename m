Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 85A00482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Dec 2001 09:57:12 -0700 (MST)
To: Maneesh Singhal <maneesh@india.hp.com>
Subject: Re: [parisc-linux] installation..... new problems..
Message-ID: <1008607423.3c1e20bf8aa88@webmail.tiscalinet.be>
Date: Mon, 17 Dec 2001 17:43:43 +0100 (CET)
From: joel.soete@freebel.net
Cc: Joel Soete <joel.soete@freebel.net>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-MOQ1008607423d1bc4ad52fd24d6e85ffd1f272bba255"
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

This message is in MIME format.

---MOQ1008607423d1bc4ad52fd24d6e85ffd1f272bba255
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit


Hey Maneesh,

Sorry for the lack of config file but I just learn to use a webmail client ??

Thanks for your understand,

Joel

Quoting Maneesh Singhal <maneesh@india.hp.com>:

> On Sun, 16 Dec 2001, Joel Soete wrote:
> 
> > Hello Maneesh,
> > 
> > >        selection .. Bus reset detected ..." etc. etc.
> > 
> > This sound like a problem I met a time ago: the scsi chain was opened
> > (ie during test I forgot to reconnect the scsi terminator to my
> external
> > drive).
> > 
> > If a scsi terminator is well connected may be could it be defective
> (or
> > a one not corresponding to your scsi interface logicaly Single-Ended
> if
> > your CD is connected to the narrow single-ended conector)?
> 
> Thanx Joel,
> 
> 	Exactly this was the problem, my scsi cable was loose, and also
> 	didn't have the terminator.. Anyway, now I installed the system.

Nice to read.

> 
> 	One new question : I am unable to start my X , whenever I do 
> 	startx it says 
> 
> 	"Fatal Server Error :
> 	no screen found "
> 
> 	Can anybody tell me why it is happening so ??????
> 
> 	Also my machine is not able to connect to any other machine...
> 	though I configured the network !!!
> 
I am not a specialist of X but I attach my XF86Config file (just a one
previously put on this list but a bit changed for new XF86 release).

Two things are important:

    a. be sure that your mouse pointer device (here /dev/psaux) is not a pointer
to /dev/gpmdata (in fact that should not happen with psaux but well with mouse)

    b. be sure that the Modes at line 395 match your screen setting (at the boot
console CO[nfiguration] MO[nitor] would display you the actual monitor set up)
Also afaik the rest of the line had to commented out or removed because
switching  does not work.

Joel
        

 

-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)


-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)

---MOQ1008607423d1bc4ad52fd24d6e85ffd1f272bba255
Content-Type: application/octet-stream; name="XF86Config"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="XF86Config"



---MOQ1008607423d1bc4ad52fd24d6e85ffd1f272bba255--
