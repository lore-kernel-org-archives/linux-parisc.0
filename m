Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "James Braid" <james.braid@peace.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] mkraid doesnt work on L2000 with 64-bit kernel 
In-Reply-To: Message from "James Braid" <james.braid@peace.com>
   of "Wed, 01 May 2002 13:25:17 +1200." <014c01c1f0af$0d0db630$5e01000a@bongo>
References: <014c01c1f0af$0d0db630$5e01000a@bongo> 
Date: Tue, 30 Apr 2002 21:42:33 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020501034233.D6192482B@dsl2.external.hp.com>
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

"James Braid" wrote:
> How do I go about submitting a patch (sorry, I am a complete newbie
> to kernel stuff). 

grab the cvsrc from
	http://cvs.parisc-linux.org/build-tools/cvsrc?rev=1.2&content-type=text/vnd.viewcvs-markup

and drop that in your ~/.cvsrc.
How-to use anonymous CVS is described on http://cvs.parisc-linux.org/

Basically a patch is the "cvs diff" output of all modified files.

grant
