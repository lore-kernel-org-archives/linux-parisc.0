From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] The problem on the PA8800 is all in the data-cache.
Date: Sun, 23 Jul 2006 11:28:45 -0500
Message-ID: <200607231128.45454.mszick@morethan.org>
References: <119aab440607221050w3b6a949j49862c2766d5c7ef@mail.gmail.com>
	<7d01f9f00607221801v256dd541l152a85d7624a8d5b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: Thibaut VARENE <T-Bone@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00607221801v256dd541l152a85d7624a8d5b@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat July 22 2006 20:01, Thibaut VARENE wrote:
> Carlos,
> 
> I'm observing something totally crazy right now. On the very same
> machine we hacked yesterday, exact same setup (same kernel, same
> binary, same everything):
> 
> i /can't/ start our static sshd anymore. It dies right after a sysctl (!):
> 
> I'm leaving the box powered up, not touching anything until we get a
> chance to investigate this a bit more.
> 

Is it still possible to capture the kernel's internal state by
copying /proc/kcore to a file somewhere?

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
