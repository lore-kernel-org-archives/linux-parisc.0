From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] [BUG] PDC stable storage broken on 2.6.13-rc3-pa1
Date: Fri, 05 Aug 2005 18:25:58 +0800
Message-ID: <42F33EB6.5060006@tausq.org>
References: <20050803183614.GB16029@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050803183614.GB16029@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> PDC stable storage driver panics/hpmc's most/all parisc boxen
> with the current 2.6.13-rc3-pa1 kernels.
> 
> Here is the backtrace and console output for c3000.
> I won't be able to chase this today.
> Maybe this weekend if no one else gets to it first.

I think that the problem is that we have an infinite recursion that is
trashing the stack.

This is happening in hwpath_to_device() which is called by
pdcspath_fetch(). hwpath_to_device tranverses the device tree. It looks
like it recurses forever, eventually filling up the stack and trashing
stuff.

Not yet sure why, nor do I really understand how the device tree
iterators work. Perhaps somebody else who understands this better will
be able to fix it quickly ;-)

randolph

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
