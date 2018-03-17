From: John David Anglin <dave.anglin@bell.net>
Subject: Re: kernel 4.15.7/64bit, C3600 is unstable during heavy I/O on PCI
Date: Sat, 17 Mar 2018 13:47:37 -0400
Message-ID: <b2fd86ec-a83a-5133-fa66-29229595851c@bell.net>
References: <CA+QBN9DxM5PYCnPJCRtgxQ8xGk75=jAtsE+VibUfFOv+Yah6Og@mail.gmail.com>
 <CA+QBN9D9vUA7Q=Sd=moi+bSAkQjGQ6nGa8wnb1=7qHudAY8L8g@mail.gmail.com>
 <20180317113655.GA30572@ls3530.fritz.box>
 <CAP6odjhTVFkFP0kzCjvpJZ81iwA+cxLNFB7AxK+hZfy_cKxjvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: Carlo Pisani <carlojpisani@gmail.com>, debian-hppa@lists.debian.org,
 linux-parisc <linux-parisc@vger.kernel.org>
To: Grant Grundler <grantgrundler@gmail.com>, Helge Deller <deller@gmx.de>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <CAP6odjhTVFkFP0kzCjvpJZ81iwA+cxLNFB7AxK+hZfy_cKxjvw@mail.gmail.com>
Resent-Message-ID: <RF-IWkiQC7.A.jhG.MTVraB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/b2fd86ec-a83a-5133-fa66-29229595851c@bell.net

Hi Grant,

On 2018-03-17 12:12 PM, Grant Grundler wrote:
> "Master Abort" means the MMIO
> transaction timed out - usually due to the device not responding to an
> MMIO read.
In lba_pci.c and sba_iommu.c, it says "BE WARNED: register writes are 
posted" and need
to be followed by a read.  It seems there are a some routines in these 
modules that have
writes that aren't followed by a read.  One is lba_wr_cfg(). Another 
might be the macro
LBA_CFG_RESTORE().  Are these okay?

It seems probable that the problem that Carlo is having is a conflict 
between devices.

Dave
