Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] serial console corruption with 2.4.18-pa2 ? 
In-Reply-To: Message from Randolph Chung <randolph@tausq.org>
   of "Fri, 01 Mar 2002 22:42:31 PST." <20020302064231.GD20672@tausq.org>
References: <20020302064231.GD20672@tausq.org> 
Date: Sat, 02 Mar 2002 22:55:02 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020303055502.BAA734832@dsl2.external.hp.com>
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

Randolph Chung wrote:
> On my c3k, everytime I boot up a kernel running 2.4.18-pa2 (narrow
> kernel), I get a lot of garbage characters during bootup (sometime 
> between hardware inventory and scsi init). Has anyone else seen this? 
> I use minicom has my serial terminal and the garbage kills minicom....

I didn't see that with 2.4.18-pa2 on my c3k using my own .config's.
Maybe you want to compare them?

It's possible an evil driver is poking around in IO port space
and deranging the suckyio serial port.

grant
