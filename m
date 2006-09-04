From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Sun, 3 Sep 2006 20:58:41 -0400 (EDT)
Message-ID: <200609040058.k840wf9p021157@hiauly1.hia.nrc.ca>
References: <20060904000937.GA6963@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: James.Bottomley@SteelEye.com,
 soete.joel@scarlet.be,
 parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060904000937.GA6963@colo.lackof.org> from "Grant Grundler" at
	Sep 3, 2006 06:09:37 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > GCC didn't do a great job of optimizing the code.  I think we would
> > get better code if clocktick and halftick were copied to temps before
> > the irqsave.
> 
> hrm...I would expect the same result from __read_mostly but can understand
> why that's not as useful as I hoped.

They are getting relead on every use.

> Can we tell GCC that clocktick doesn't change during execution of this code?
> ie despite being a global, it's a "constant" and doesn't need to be
> reloaded on each loop iteration?

I think it's tricky.  Constants go in readonly data.  However, the
values need to be initialized at runtime.  Copying the values to
"register" tempories before the loop seems to resolve the problem.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
