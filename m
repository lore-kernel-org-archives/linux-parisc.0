Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 21 Mar 2003 10:05:02 -0700
To: Markus Schaber <markus.schaber@student.uni-ulm.de>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20030321170502.GA8719@dsl2.external.hp.com>
References: <20030321000822.6a0123e0.markus@schabi.de> <20030321065534.GA21566@dsl2.external.hp.com> <20030321092201.5dcedd9f.markus.schaber@student.uni-ulm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030321092201.5dcedd9f.markus.schaber@student.uni-ulm.de>
From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: [parisc-linux] Re: Out of memory problem
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

On Fri, Mar 21, 2003 at 09:22:01AM +0100, Markus Schaber wrote:
> I don't want to use the machine for serious work, it's just as a proof
> of concept.
> 
> Maybe I'll see whether I can upgrade the machine with more memory...

that would be a good idea - even for proof of concept.

> > See www.parisc-linux.org.
> 
> I was there and didn't find a pre-build net-boot image that uses NFS
> root (you see, I wanted to avoid the need of an cross-compile
> environment), but I'll try again next week (I'm away over the weekend).

The Net install ISOs are what you want. See
	http://www.parisc-linux.org/software/install.html

Using is NFS Root is not parisc specific - see debian.org for documentation.
There's also nfsroot.txt with every kernel source tree:
	http://cvs.parisc-linux.org/linux/Documentation/nfsroot.txt?rev=HEAD&content-type=text/vnd.viewcvs-markup

Offhand I don't know where to find a relatively current parisc NFS Root.
You could try to copy the contents of the install CD to a local directory
on an NFS server, hack that up a bit, and export the result.

grant
