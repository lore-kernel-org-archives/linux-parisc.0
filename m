Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 26C92485E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Mar 2002 02:19:52 -0700 (MST)
Received: from www-data by webmail.tiscalinet.be with local (Tiscali)
	id 16pQdl-0004KR-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Mar 2002 10:19:45 +0100
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1017047985.3c9eebb1b0bbe@webmail.tiscalinet.be>
Date: Mon, 25 Mar 2002 10:19:45 +0100 (CET)
From: joel.soete@freebel.net
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] Fwd: Re: Verifying gpm problems.
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

Just for information.

Joel

----- Forwarded message from joel.soete@freebel.net -----
Date: Mon, 25 Mar 2002 08:31:40 +0100 (CET)
From: joel.soete@freebel.net
Reply-To: joel.soete@freebel.net
Subject: Re: Verifying gpm problems.
To: "Zephaniah E. Hull" <warp@babylon.d2dc.net>

Quoting "Zephaniah E. Hull" <warp@babylon.d2dc.net>:

> I have some bad news, your mouse does not know how to speak the PS/2
> protocol.
> 
> Research seems to indicate that the HP mice are the same as the OEM
> Logitech mice, which are known to be broken.
> 
> There is no way to handle this correctly, you will have to use the
> fups2 protocol.
type=fups2 works fine (in /etc/gpm.conf) (for gpm-1.19.6-11 naturally)

Thanks a lot for advise and attention,
    Joel
> 
> Sorry.

> 
> Zephaniah E. Hull.
> 
> On Sat, Mar 23, 2002 at 11:59:10AM +0000, Joel Soete wrote:
> > Here you are.
> > 
> > Again sorry for inconvenience,
> > 	Joel
> 
> -- 
> 	1024D/E65A7801 Zephaniah E. Hull <warp@babylon.d2dc.net>
> 	   92ED 94E4 B1E6 3624 226D  5727 4453 008B E65A 7801
> 	    CCs of replies from mailing lists are requested.
> 
> "I am ecstatic that some moron re-invented a 1995 windows fuckup."
>         -- Alan Cox
> 


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)

----- End forwarded message -----


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
