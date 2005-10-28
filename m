From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Re: 2.6.14 has been released,
Date: Fri, 28 Oct 2005 16:22:21 +0200
Message-ID: <IP2QL9$80D9D12BAAD377014AEB6EE5322A5F7D__7550.54031401432$1416623933$gmane$org@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: debian-kernel <debian-kernel@lists.debian.org>,
 "sven.luther" <sven.luther@wanadoo.fr>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>,
 matthew <matthew@wil.cx>
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

> > On Fri, Oct 28, 2005 at 05:34:06PM +0900, Horms wrote:
> > > Also, can someone look into HPPA, or point me at which patch to use=
?
> > >
http://packages.vergenet.net/testing/linux-2.6-2.6.14/linux-2.6_2.6.14-1-=
hppa.log.gz
> > 
> > I know I *said* not to use the -pa0 kernel, but it's booted fine for =
me
> > on a K460 and an N4000.   Any other reports?
> 
> Not -pa0 but 2.6.14-rc5-pa1 has been up for more than 7 days now on
> my c3k.  Nothing since 2.6.8.1-pa11 has been this stable.  However,
> gsyprf11 with 64-bit SMP hasn't been as stable (two crashes doing
> GCC builds and checks in roughly the same period).
> 
Dave I fully agree with you: I even report numerous succesfull stress tes=
t
(only up system) on some b180 and b2k 32bit and the same success with
reverting latest frp tausq patch (i.e. re-enabling fpr) ;-)

Still have to do:
    o have to stress more d380 (32bit smp system)
    o test gcc-4.1 build (on various system's 32/64 bit smp/up)

Joel=0A=0A---------------------------------------------------------------=
=0AA free anti-spam and anti-virus filter on all Scarlet mailboxes=0AMore=
 info on http://www.scarlet.be/

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
