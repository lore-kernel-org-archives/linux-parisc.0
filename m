From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Re: gsyprf11 and 2.6.13-rc3-pa1
Date: Tue, 16 Aug 2005 18:10:24 +0800
Message-ID: <4301BB90.5060907@tausq.org>
References: <ILB5TV$CA7EA436EF33A0C6E0748DAEC30B9B9F@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: "James.Bottomley" <James.Bottomley@SteelEye.com>,
 dave <dave@hiauly1.hia.nrc.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>,
 tsg45800 <tsg45800@scarlet.be>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <ILB5TV$CA7EA436EF33A0C6E0748DAEC30B9B9F@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> on a b180 model runing the latest cvs 2.6.13-rc6-pa1 (compiled with debian
> stock gcc-4.0, as it's an unstable install but downgraded libc6 2.3.2), foo
> runs untils:
> ...
> Estimating stack consumed 0x7fee40
> Estimating stack consumed 0x7fef80
> Estimating stack consumed 0x7ff0c0
> ====<hang>===
> 
> The ping still responding but not anymore the console (nor other process
> apparently)... no more heartbit/disk leds flashing; pressing TOC buton launch
> the reboot but what is bad: nothing was saved in piminfo (all 0 and No valid
> timestamp) :-(

Yup, this is the same as what others are seeing. It's definitely a
problem with infinitely looping signal handlers.

I'm not sure what's the "correct" behavior in this case. I recall now
that we saw a similar problem with expect where the signal handler was
recursing.

Is the kernel responsible for blocking SIGSEGV handlers that generate
SIGSEGV?

randolph

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
