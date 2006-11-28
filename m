From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Prebuilt kernels not available
Date: Mon, 27 Nov 2006 19:41:55 -0500
Message-ID: <20061128004155.GB18370@tachyon.int.mcmartin.ca>
References: <200611261138.51972.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200611261138.51972.deller@gmx.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Nov 26, 2006 at 11:38:51AM +0100, Helge Deller wrote:
> I just noticed, that we don't have any recent prebuilt kernels at the kernel download page any longer:
> http://cvs.parisc-linux.org/download/linux-2.6/
> 
> It's still at 2.6.18-rc1-pa5 from July.
> 

It hasn't been updated for Git. Now that we pretty much build
straight out of Linus' tree barring some recent devel work, I don't
see too much value providing autobuilt images.

I spent a bit of time playing with the idea of a tinderbox to build
-git snapshots daily, but never bothered to see it through to completion.

Cheers,
	Kyle M.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
