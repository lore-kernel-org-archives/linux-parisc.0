Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from guinness.internal.neep.com.au (123.telstra.ppp.reynolds.net.au [203.38.119.123])
	by dsl2.external.hp.com (Postfix) with ESMTP id 49A3D4837
	for <parisc-linux@parisc-linux.org>; Fri, 19 Jul 2002 05:42:08 -0600 (MDT)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id TAA00221
	for parisc-linux@parisc-linux.org; Fri, 19 Jul 2002 19:39:46 +0800
Date: Fri, 19 Jul 2002 19:39:43 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] CVS Question?
Message-ID: <20020719193941.A30931@neep.com.au>
References: <1027059894.3d37b0b63e61b@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1027059894.3d37b0b63e61b@webmail.tiscalinet.be>; from joel.soete@freebel.net on Fri, Jul 19, 2002 at 08:24:54AM +0200
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

joel.soete@freebel.net said:
> Hi all, 
> 
> In parisc-linux cvs, with cvs is possible to co and update only general and 
> hppa specific sources (avoiding other arch: arm, ppc, ...)?
> 
> Thanks for info,
>    Joel

Unfortunately the .cvsignore files are for 'local ignorance' and you
can't use the cvs -I (ignore) flag with checkout.  You can with import
and update though, which is good, and at least something.

Two possible courses of action for you that spring to mind:

  1) (i)   check out the entire tree
     (ii)  delete the directories you don't want
     (iii) only perform future cvs updates with '-P', removing '-d' from
           your .cvsrc or just skipping .cvsrc for this module:
	     cvs -f up -P .

  2) (i)   check out the entire tree
     (ii)  locate all the directories you don't want, but don't delete
           them (or just leave the empty directories in place)
     (iii) put their paths in a file e.g. ~/.cvs_ignores
     (iv)  perform future cvs updates with a commend like this:
             cvs up -dP $(for dir in $(cat ~/.cvs_ignores); do echo -n \
	     "-I $dir "; done) .

I use '.' because I assume you're already in the module directory when
you do the cvs update - that's what I do anyway.

Please note that I haven't tried either of these.  I'm pretty confident
that (1) will work as you want it to, but (2) may not.

HTH

Andrew.

-- 
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
