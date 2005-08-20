From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] B132L outperforms C160 - 64-bit userland needed?
Date: Sat, 20 Aug 2005 00:26:35 -0600
Message-ID: <20050820062635.GB28839@colo.lackof.org>
References: <ILESU1$F6D40EC654A84E56AFFAC27CDCE1FD84@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>,
 tsg45800 <tsg45800@scarlet.be>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <ILESU1$F6D40EC654A84E56AFFAC27CDCE1FD84@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Aug 18, 2005 at 10:27:37AM +0200, Joel Soete wrote:
> mmm, is this system need ccio-dma and zalon:ncr53c720 drivers
> as does my d380?

C160 will need both ccio-dma and zalon.
we've run ccio-dma in 64-bit in the past.
I'm not as sure about zalon driver.

> On my d380 those two drivers doesn't seems to be 64bit
> ready :_( (2.6.12-pa2)

Doesn't compile or doesn't boot?

> (I expect to find simple instrumentation tools like IKD
> (but not maintain for 2.6) or LTT to help me to figure
> out if some race condition (as I suspect)
> occures or not)

There are plenty of things that don't work for palinux.
The parisc port is just doing "ok" - not excellent.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
