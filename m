From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] Re: tst-audit.h missing?
Date: Sun, 16 Jul 2006 14:13:48 -0400
Message-ID: <119aab440607161113r2216a066v708af4d9c238849c@mail.gmail.com>
References: <20060716180811.GB29459@titanium.v3.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: libc-ports@sources.redhat.com,
 parisc-linux@lists.parisc-linux.org
To: "Jeff Bailey" <jbailey@raspberryginger.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060716180811.GB29459@titanium.v3.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 7/16/06, Jeff Bailey <jbailey@raspberryginger.com> wrote:
> Carlos,
>
> I don't see sysdeps/hppa/tst-audit.h in my checkout and a grep doesn't
> show me anything that might define pltenter, pltexit & friends.  Without
> this, elf/tst-auditmod1.c won't compile.
>
> This seems to do the trick:
>
> 2006-07-16  Jeff Bailey  <jbailey@ubuntu.com>
>
>         * sysdeps/hppa/tst-audit.h: New file.

Thanks! I'll check this into CVS.

I have tst-audit.h in my development tree, along with a first cut
implementation for dl-trampoline.S (dl_profile).

Expect the auditing tests to fail until I check this into CVS.

Cheersr,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
