Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Nahkola Mikko <mikko.nahkola@nokia.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] framebuffer depth and other issues ... 
In-Reply-To: Message from Nahkola Mikko <mikko.nahkola@nokia.com>
   of "Mon, 28 Oct 2002 13:25:52 +0200." <20021028112551.GR15137@aurinko.ntc.nokia.com>
References: <20021028112551.GR15137@aurinko.ntc.nokia.com> 
Date: Mon, 28 Oct 2002 17:49:34 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021029004934.DFB5E4829@dsl2.external.hp.com>
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

Nahkola,
You asked alot of questions. I take a shot at one of them:

Nahkola Mikko wrote:
> And as an aside, how reliable is the disk stuff nowadays? Would it make 
> any sense to run a file server on Linux/hppa yet?

Yes. I'm running a linux http/ftp server inhouse on a B180 with 200GB disk.
It mirrors RH/SuSE/Mandrake and Debian for Cupertino site.
I have to get mrtg running again to collect stats.
Nightly updates and it's never crashed.

BTW, this box also serves as my regular desktop.

> I mean, something like 
> a stack of A3312As, software-RAID and NFS ... is it likely to work?

I don't do RAID or NFS. I mean this *is* a mirror.

> How 
> about performance, compared to HP-UX, for example? (yes, I'd expect HP-UX 
> to be somewhat better, but by how much?)

lmbench results are in the parisc-linux mail archive (lists.parisc-linux.org).
IO/FS stuff was comparable, linux context switching sucks.

grant
