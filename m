Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Joel Soete <joel.soete@freebel.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] jfs-1.0.23 as well xfs-cvs break fb console on k-2.4.19-pa22 
In-Reply-To: Message from Joel Soete <joel.soete@freebel.net>
   of "Sat, 19 Oct 2002 19:45:35 -0000." <3DB1B65F.5020203@freebel.net>
References: <3DA56CAE00003256@ocpmta8.be.tiscali.com>  <3DB1B65F.5020203@freebel.net> 
Date: Sat, 19 Oct 2002 21:44:03 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021020034403.AF4F14829@dsl2.external.hp.com>
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

Joel Soete wrote:
> The very first patch 2.4.19 I still have was pa5 and the same problem occur.
> It seems definitely that JFS and STI FB in 2.4.19 are incompatible.
> Where do I have to start my investigation?
...
> Really no idea?

Sorry. I don't. And until 2.4.19 boots on the A500-6X,
I'm not interested in chasing the JFS/STI issue.

My advice is to start adding printk's in the main vfs_ops entry
points to JFS until you can narrow down which entry point is
having problems. Then start looking STI to see if anything
in the JFS code uses the same services or something.

grant
