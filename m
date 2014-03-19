From: Eric Paris <eparis@redhat.com>
Subject: Re: [PATCH 3/4] ARCH: AUDIT: implement syscall_get_arch for all
 arches
Date: Wed, 19 Mar 2014 19:02:24 -0400
Message-ID: <1395270144.10106.0.camel@localhost>
References: <1395266643-3139-1-git-send-email-eparis@redhat.com>
	 <1395266643-3139-3-git-send-email-eparis@redhat.com>
	 <CAEdQ38Ex47GxhN1ZZMu+RETpWs-ENbfCr8v=6iFg9p_QWaa9zw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-audit@redhat.com, linux-ia64@vger.kernel.org,
	microblaze-uclinux@itee.uq.edu.au,
	"linux-mips@linux-mips.org" <linux-mips@linux-mips.org>,
	linux@openrisc.net,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
To: Matt Turner <mattst88@gmail.com>
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <CAEdQ38Ex47GxhN1ZZMu+RETpWs-ENbfCr8v=6iFg9p_QWaa9zw@mail.gmail.com>
List-ID: <sparclinux.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 2014-03-19 at 15:19 -0700, Matt Turner wrote:
> On Wed, Mar 19, 2014 at 3:04 PM, Eric Paris <eparis@redhat.com> wrote:
> > For all arches which support audit implement syscall_get_arch()
> 
> support audit -- is that AUDIT_ARCH? If so, alpha gained support
> recently, so I think this patch needs to handle alpha too?

Absolutely right.  I broke Alpha (in the next patch).  Will fix.

-Eric

