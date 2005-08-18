From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] B132L outperforms C160 - 64-bit userland needed?
Date: Thu, 18 Aug 2005 10:27:37 +0200
Message-ID: <ILESU1$F6D40EC654A84E56AFFAC27CDCE1FD84@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>,
 tsg45800 <tsg45800@scarlet.be>
To: "grundler" <grundler@parisc-linux.org>
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

> On Wed, Aug 17, 2005 at 11:27:24PM -0600, Kurt Fitzner wrote:
> > p.s.  I installed HPUX in 64-bit mode.  Which, so I'm told, should ha=
ve
> > decreased my performance.  I'd like to get my C160 running Linux in
> > 64-bit mode, but I can't. :(
> 
> Sure you can. recent 64-bit kernels will boot on C160.
> It's just not an obvious win in most cases.
> 
mmm, is this system need ccio-dma and zalon:ncr53c720 drivers as does my =
d380?

[...]
> 
> But if it's an OS problem (it could be), running lmbench
> on both HPUX and parisc-linux might shed light on where
> the issue is.
> 
On my d380 those two drivers doesn't seems to be 64bit ready :_( (2.6.12-=
pa2)
(I expect to find simple instrumentation tools like IKD (but not maintain=
 for
2.6) or LTT to help me to figure out if some race condition (as I suspect=
)
occures or not)

Thanks,
    Joel
=0A=0A---------------------------------------------------------------=0AA=
 free anti-spam and anti-virus filter on all Scarlet mailboxes=0AMore inf=
o on http://www.scarlet.be/

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
