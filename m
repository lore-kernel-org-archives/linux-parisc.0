From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH 0/6] kbuild: refactor Makefiles related with cc-version
Date: Fri, 09 Jan 2015 17:27:33 +0100
Message-ID: <54B00175.4050702@suse.cz>
References: <1419485488-22336-1-git-send-email-yamada.m@jp.panasonic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: Peter Oberparleiter <oberpar@linux.vnet.ibm.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"H. Peter Anvin" <hpa@linux.intel.com>, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Robert Richter <rrichter@cavium.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Helge Deller <deller@gmx.de>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Andi Kleen <ak@linux.intel.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Paul Mackerras <paulus@samba.org>,
	Ingo Molnar <mingo@redhat.com>, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
To: Masahiro Yamada <yamada.m@jp.panasonic.com>,
	linux-kbuild@vger.kernel.org
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1419485488-22336-1-git-send-email-yamada.m@jp.panasonic.com>
List-ID: <linux-doc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2014-12-25 06:31, Masahiro Yamada wrote:
> Masahiro Yamada (6):
>   kbuild: fix cc-ifversion macro
>   kbuild: do not add $(call ...) to invoke cc-version or cc-fullversion
>   kbuild,gcov: remove unnecessary workaround
>   kbuild,gcov: simplify kernel/gcov/Makefile
>   kbuild: allow cc-ifversion to have the argument for false condition
>   kbuild,gcov: simplify kernel/gcov/Makefile more

Applied to kbuild.git#kbuild, thanks.

Michal

