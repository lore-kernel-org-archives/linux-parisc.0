From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] [PATCH] parisc: Disable LWS debugging
Date: Tue, 22 May 2007 11:49:28 -0400
Message-ID: <20070522154928.GD16717__43557.9964927912$1416624361$gmane$org@fattire.cabal.ca>
References: <20070522153825.GA16404@farad.aurel32.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: Aurelien Jarno <aurelien@aurel32.net>,
 linux-kernel@vger.kernel.org,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070522153825.GA16404@farad.aurel32.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, May 22, 2007 at 05:38:26PM +0200, Aurelien Jarno wrote:
> The LWS debugging code on parisc is wrongly enabled due to a bug in the
> use of the preprocessor directives. This debugging code is not thread 
> safe and causes problems with a recent glibc on SMP kernels.
> 
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

merged.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
