From: Andres Salomon <dilinger@debian.org>
Subject: Re: RFC: Updating hppa kernel-image packages
Date: Tue, 22 Mar 2005 16:56:22 -0500
Message-ID: <pan.2005.03.22.21.56.10.977426__40315.5845161111$1416623708$gmane$org@debian.org>
References: <20050322204751.GC26941@roadwarrior.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux@lists.parisc-linux.org,
 debian-kernel@lists.debian.org
To: debian-hppa@lists.debian.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
Resent-Message-ID: <iXp8K.A.2dF.JlKQCB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

On Tue, 22 Mar 2005 15:47:51 -0500, Kyle McMartin wrote:

> [d-k copied about ABI[0] change]
> 
> The current crop of 2.6.8 kernel images in unstable and testing are
> quite good, but a new upload is required to fix some security bugs
> and some hppa-related bugs.
> 
> This is basically a call for suggestions for what I should backmerge
> to 2.6.8 from recent CVS. I will go through the parisc-linux-cvs archive
> again and try to pull what I can see, but I'd like a bit of help.
> 
> These changes can be categorized in two, ones which change the module
> ABI, and ones that don't. 
> 
> To help keep the lives of the debian-installer folks sane, I'm not
> going to honour suggestions to turn on/off various drivers, unless
> I get an explicit ok.
> 
> [Non-ABI breaking changes] - The following are candidates for merging
>                              immediately.
> 
> 	- Rebuild against recent kernel source for security fixes.
> 	- Grant pointed out some recent fixes he made to ccio and sba_iommu
>           which fix memory starvation on low-memory machines with iommus.
> 
> [ABI breaking changes] - The following will wait until the next ABI
>                          rev from kernel-source.
> 
> 	- Disabling USB_DEBUG in all the configs. This was erroneously
>           enabled and is disabled on all other architectures.
> 

Do you know what symbols it affects?

FYI, what I'll do to compare ABIs is, post build:

sed -e 's/^\(.\+\)[[:space:]]\+\(.\+\)[[:space:]]\(.\+\)$/\3 \2 \1/' 
path/to/2.6.8-13/build-686/Module.symvers | sort  > 2.6.8-13.abi
sed -e 's/^\(.\+\)[[:space:]]\+\(.\+\)[[:space:]]\(.\+\)$/\3 \2 \1/' 
path/to/2.6.8-15/build-686/Module.symvers | sort  > 2.6.8-15.abi
diff -u 2.6.8-1{3,5}.abi

That tells you exactly what symbols were added, removed, and modified,
within vmlinux as well as all kernel modules.

> There seem to be a few security bugs waiting on a rev of the ABI as well.
>

Just one; CAN-2005-0449.
 
> Thanks,
> 	Kyle M.
> 
> [0] - for those following at home, the ABI of a kernel is reflected
>       in the package name, like the soname of a shared library.

I usually call it an ABINAME to distinguish it from a library's SONAME.




-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
