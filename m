From: Jeff Bailey <jbailey@raspberryginger.com>
Subject: Re: [parisc-linux] Re: A warning about NPTL pthreaddefs.h
Date: Tue, 18 Jul 2006 03:12:42 -0700
Message-ID: <20060718101242.GA12796@titanium.v3.ca>
References: <119aab440607171537p25d0350he9aa937c439c428a@mail.gmail.com>
	<44BC2900.4030303@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <44BC2900.4030303@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jul 18, 2006 at 08:19:12AM +0800, Randolph Chung wrote:
> >A warning that the pthreaddefs.h might be horribly wrong. I remember a
> >long while ago adding padding the structures so they matched the size
> >of the linuxthread types (atleast the lock position).
> >
> >This padding is not correct, we would need to pull into our tree the
> >static mutex initializers so they are correctly sized aswell.
> 
> fwiw,i don't think we need to worry about making the structs the same as 
> linuxthreads (if that is even possible...), after all you cannot run a 
> linuxthreads binary against nptl libs or vice versa...

On other platforms, LT binaries generally run on the NPTL libs.  If we
break this, then there'll be an interesting upgrade problem for the
distros tosolve that they haven't needed to do on other archs.

Tks,
Jeff Bailey

-- 
I do not agree with a word you say, but I will defend to the death your
right to say it. 
 - Voltaire
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
