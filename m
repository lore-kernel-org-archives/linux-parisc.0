From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Re: gsyprf11 and 2.6.13-rc3-pa1
Date: Tue, 16 Aug 2005 11:17:55 +0200
Message-ID: <ILB5TV$CA7EA436EF33A0C6E0748DAEC30B9B9F@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: "James.Bottomley" <James.Bottomley@SteelEye.com>,
 dave <dave@hiauly1.hia.nrc.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>,
 tsg45800 <tsg45800@scarlet.be>
To: "dave" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > > static void sighandler(int sig)
> > > {
> > >         printf("Got signal %d\n", sig);
> > >         exit(0);
> > 
> > I think you need to use _exit in a signal handler although this may
> > not be an issue when there is only one thread.
> 
> GCC uses exit.  Either way, the kernel shouldn't hang.
> 
Randolph , Dave,

Eventhought it does:
on a b180 model runing the latest cvs 2.6.13-rc6-pa1 (compiled with debia=
n
stock gcc-4.0, as it's an unstable install but downgraded libc6 2.3.2), f=
oo
runs untils:
...
Estimating stack consumed 0x7fee40
Estimating stack consumed 0x7fef80
Estimating stack consumed 0x7ff0c0
=3D=3D=3D=3D<hang>=3D=3D=3D

The ping still responding but not anymore the console (nor other process
apparently)... no more heartbit/disk leds flashing; pressing TOC buton la=
unch
the reboot but what is bad: nothing was saved in piminfo (all 0 and No va=
lid
timestamp) :-(

If some other test will be helpfull: don't hesistate.

Joel=0A=0A---------------------------------------------------------------=
=0AA free anti-spam and anti-virus filter on all Scarlet mailboxes=0AMore=
 info on http://www.scarlet.be/

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
