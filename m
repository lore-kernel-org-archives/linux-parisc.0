From: Guy Martin <gmsoft@tuxicoman.be>
Subject: NFS broken in latest 2.6.37-rcX
Date: Wed, 22 Dec 2010 22:34:10 +0100
Message-ID: <20101222223410.3a5f44c3@zombie>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


Hi all,


It seems that NFS got broken recently.
I've bisected this to babddc72a9468884ce1a23db3c3d54b0afa299f0.

Both NFS version 2 and 3 are affected. I haven't tested NFS 4.

I've been able to reproduce with both 32bit and 64bit kernels using
gcc-4.5.1 with the fix for PR46915 included.

To reproduce, simply mount an NFS share and try to list the files with
ls.

When listing the directory, the code seem to be looping in the commit I
mentioned. The network traffic goes high and you always see the same
packets flowing.

In current HEAD, the behavior is slightly different. The process uses
100% and either you get a kernel panic or if you are lucky, you get
something like "memory exhausted".


I'm not sure how to troubleshoot this further.

Any idea ?


  Guy
