From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 1/4] PCI: Remove redundant pcibios_set_master()
 declarations
Date: Thu, 5 Oct 2017 22:57:16 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1710052256540.2398@nanos>
References: <20171005201939.18300.25690.stgit@bhelgaas-glaptop.roam.corp.google.com> <20171005203842.18300.67328.stgit@bhelgaas-glaptop.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-pci@vger.kernel.org, linux-mips@linux-mips.org,
        Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
        linux-sh@vger.kernel.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        David Howells <dhowells@redhat.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Paul Mackerras <paulus@samba.org>,
        "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
        Jesper Nilsson <jesper.nilsson@axis.com>,
        linux-am33-list@redhat.com,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Helge Deller <deller@gmx.de>, x86@kernel.org,
        "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Ingo Molnar <mingo@redhat.com>,
        Matt Turner <mattst88@gmail.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        linux-xtensa@linux-xtensa.org, Mikael Starvik <starv
To: Bjorn Helgaas <helgaas@kernel.org>
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20171005203842.18300.67328.stgit@bhelgaas-glaptop.roam.corp.google.com>
List-ID: <sparclinux.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 5 Oct 2017, Bjorn Helgaas wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> All users of pcibios_set_master() include <linux/pci.h>, which already has
> a declaration.  Remove the unnecessary declarations from the <asm/pci.h>
> files.
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
