From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Add build-time sanity checks for compat ipc
 struct sizes
Date: Thu, 29 Oct 2015 22:59:48 +0100
Message-ID: <563296D4.8060203@gmx.de>
References: <20151028223010.GA27319@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20151028223010.GA27319@ls3530.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 28.10.2015 23:30, Helge Deller wrote:
> Ensure that the size of various compat ipc structs are the same as of
> the native kernel.

I've pushed all of my patches (with modifications to what I sent earlier) to 
fix the IPC structs into the compat-patches branch of my git tree.
If someone wants to test, please pull from here:
 git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git compat-patches

It's based on the sources of kernel 3.18 but merges cleanly up to git head.

Helge
