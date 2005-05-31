From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: Matrox Mystique video card caused Kernel Panic
	on HP Visualize 785/B2000 with rebuilt 2.6.8 kernel
Date: Tue, 31 May 2005 15:10:14 -0600
Message-ID: <20050531211014.GB2674@colo.lackof.org>
References: <5.1.1.6.1.20050530221651.0238dca8@pop.singnet.com.sg>
	<5.1.1.6.1.20050530221651.0238dca8@pop.singnet.com.sg>
	<5.1.1.6.1.20050531110035.02358110@pop.singnet.com.sg>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "J. L. Lee" <jllee@singnet.com.sg>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <5.1.1.6.1.20050531110035.02358110@pop.singnet.com.sg>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, May 31, 2005 at 11:09:05AM +0800, J. L. Lee wrote:
> I am a novice to Linux, especially the Debian variant and the HP 
> workstations. I am also not a programmer so afraid you have to be patient 
> with me.

no problem.
Please keep the parisc-linux list cc'd so the mail gets archived.

> You mentioned "The symptom is consistent with derefencing an address that's 
> not ioremapped. But it looks like ioremapped is being called in 
> initMatrox2(). You want to add printk's to make sure that's happening like 
> we expect."
> 
> I don't understand what you mean but if you can direct me to where I could 
> change the coding in the source code I will give it a try and let you know 
> the result.

What I meant was, in drivers/video/matrox/matroxfb_base.h
add a printk to mga_ioremap() and to mga_iounmap() so we know
what the virtual and physical addresses are and when to expect
the mappings to be valid.
Sorry, I don't have time to cook up a proper patch.

Please also build with CONFIG_FB_MATROX=m (as a module) so you can first:
	lspci -v
	cat /proc/iomem

then "modprobe maxtroxfb" once you are ready to crash the machine.


> ps. Yes, I have referred to the Graphics How-To. That is why I chose the 
> Matrox video card. I have S3 Virge too but there is no configurable S3 
> driver in the kernel configuration file.

Ok. If someone can tell me S3 Virge is compatible with another matrox
cards, I'd be happy to add it to the How-To.

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
