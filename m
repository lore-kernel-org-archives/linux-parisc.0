Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id C9D6F4841
	for <parisc-linux@lists.parisc-linux.org>; Mon, 27 Oct 2003 21:55:32 -0700 (MST)
Date: Mon, 27 Oct 2003 21:55:31 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Nicholas Leippe <nick@byu.edu>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Install failure: C240, 3.0r1, 2003.09.24 and 2003.10.22 net inst isos
Message-ID: <20031028045531.GA21288@colo.lackof.org>
References: <200310271933.00659.nick@byu.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200310271933.00659.nick@byu.edu>
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

Nicholas,
thanks for the bug report.
Please see http://www.parisc-linux.org/faq/kernelbug-howto.html

more questions/comments below.

On Mon, Oct 27, 2003 at 08:33:00PM -0600, Nicholas Leippe wrote:
> Hello all,
> 
> I just got my new C240 set up and attempted to install.  With either of
> 
> palinux-2.4.22-pa9-20030924-netinst.iso
> palinux-2.4.22-pa13-20031022-netinst.iso
> 
> it boots into the debian installer and then promptly hangs at the 'select 
> language' menu.

See "Hung Kernels" section in the FAQ.

Did you try to install with serial console or graphics console?
With serial console, it's easier to capture the output.
And it's possible this bug only affects graphical console.

>   I dug around the archives and found an email about this 
> from several years ago, but no resolution was posted.

URL for mail you found?

> So I dug out my 3.0r1 cd to try but got an HPMC a little ways into the 
> kernel boot.  I know the 3.0r1 cd is good, since I successfully installed 
> a C180 with it (besides checking the md5s, which I also did for the 
> netinst isos).
> 
> HPUX 11.11 successfully boots on this machine, so I'm not leaning towards 
> thinking there's a hardware fault.
> 
> Any ideas?  Need more info?--just tell me what and how to get it.

"in io" output from the boot console handler would also be good.

thanks,
grant
