From: "Jeff Bailey" <jbailey@raspberryginger.com>
Subject: Re: [parisc-linux] More testsuite info
Date: Mon, 21 May 2007 13:12:18 -0400
Message-ID: <5b2e36650705211012v725065cfw5aa03bc60f69e095__49771.5443176732$1416624358$gmane$org@mail.gmail.com>
References: <5b2e36650705202338wa690426i956e716cebbd593d@mail.gmail.com>
	<200705211643.l4LGhtvv008432@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
Cc: lamont@mmjgroup.com,
 parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200705211643.l4LGhtvv008432@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 21/05/07, John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
> > but four additional ones:
> > WARNING: program timed out.
> > FAIL: thread/pthread1.cc execution test
> > WARNING: program timed out.
> > FAIL: thread/pthread3.cc execution test
> > WARNING: program timed out.
> > FAIL: tr1/2_general_utilities/memory/shared_ptr/thread/default_weaktoshared.cc e
> > xecution test
> > FAIL: tr1/2_general_utilities/memory/shared_ptr/thread/mutex_weaktoshared.cc exe
> > cution test
>
> These don't fail with linuxthreads.  If mutex_weaktoshared didn't timeout,
> then there's an implementation problem with threads (e.g., bug reported
> by Aurelien).

These don't fail with the glibc-2.5 (nptl) compiled with gcc-4.1
either.  The only change here is that the glibc was compiled with
gcc-4.2 instead.  Otherwise it's NPTL before and after.

-- 
Jeff Bailey - http://www.raspberryginger.com/jbailey/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
