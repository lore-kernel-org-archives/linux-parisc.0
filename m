From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: GCC 4.5 regression
Date: Thu, 17 Feb 2011 14:48:07 -0500
Message-ID: <20110217194806.GA18632@hiauly1.hia.nrc.ca>
References: <20110217201523.2da3b41a@zombie>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110217201523.2da3b41a@zombie>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 17 Feb 2011, Guy Martin wrote:

> I've spotted this regression while testing gcc 4.5.2.
> It hangs while doing one of the configure test of diffutils.
> 
> I've attached a reduced test case. The program is supposed to
> segfault because of a stack overflow. However, with 4.5, it just hangs.
> It seems that 4.5 simply over-optimize the function and replaces it
> with a single jump.
> 
> Should I open a PR ?

My sense is the test is wrong and the optimization is correct.

Optimizations such as this are done at the tree and rtl level.
For the most part, backends do not perform loop optimizations.
So, if you think the generated code is incorrect based on the
C standard, then a PR should be opened.

There are quite a few '-f' options that affect optimization behavior.
So, you may be able to disable loop optimizations and restore the
previous behavior.

There may be a newer autoconf test available.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
