Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12502.mail.yahoo.com (web12502.mail.yahoo.com [216.136.173.194])
	by dsl2.external.hp.com (Postfix) with SMTP id 221664829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Sep 2002 19:28:53 -0600 (MDT)
Message-ID: <20020918012851.16678.qmail@web12502.mail.yahoo.com>
Date: Tue, 17 Sep 2002 18:28:51 -0700 (PDT)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] Re: [lists] installing Linux on A Visualise C240
To: parisc-linux@lists.parisc-linux.org
Cc: Yves Vrijhoeven <yvesvrijhoeven@hotmail.com>
In-Reply-To: <3D87BEBB.5080306@freebel.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Yves,

I had this same issue with my C180 workstation when booting from my
graphics card loaded in the card cage.  I was able to get the system to
work using my onboard graphics port, but the C240 does not have an
onboard graphics port.  My external graphics card is not supported
(A4071A).  More than likely you have a graphics card in there that is
not supported yet and more than likely never will be.  There is little
information about HP graphics cards out there in order to write the
drivers for them.  If you could give us the product number of the card
we could tell you whether or not it is a supported card.  If it is
supported there is a configuration in the boot handler that is not
correct.  The product number is a letter followed by 4 number then a
letter (ex: A3312A) if you aren't familier with HP product codes.

derek

  
--- Joel Soete <joel.soete@freebel.net> wrote:
> 
> 
> dann wrote:
> > Yves,
> >   forwarding to the parisc-linux, which is a more appropriate place
> > for this question.
> > 
> > as an aside, 0.9.3 is not the latest release - debian 3.0 contains
> newer bits.
> > <hint>maybe one of these days someone will point that out on
> -announce</hint>
> 
> Dann you have right 0.9.3 iso is quiet old and Debian3.0r0 iso are 
> referenced on :http://www.parisc-linux.org/index.html (i do not find
> it 
> any more on .de? but well on .se)
> 
> As well as the net install iso (when it is possible to install over a
> 
> network connection) which offer the advantage to propose the last 
> development kernel :)
> 
> Yves, good luck
> 
> 	Joel
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


__________________________________________________
Do you Yahoo!?
Yahoo! News - Today's headlines
http://news.yahoo.com
