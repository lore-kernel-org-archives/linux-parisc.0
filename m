From: James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] ncr53c8xx patch for c110
Date: 21 Jun 2004 11:17:04 -0500
Message-ID: <1087834626.1797.38.camel@mulgrave>
References: <40BD9F870000CE2A@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <40BD9F870000CE2A@ocpmta2.freegates.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, 2004-06-21 at 11:11, Joel Soete wrote:
> It should be. The c110 also have such LASI ASIC chip ;) and on its scsi
> port I connected a CRW drive. This week-end I tried to uncompress-untar
> the src of my working kernel tree burned on a cd. but the operation failled
> with an i/o error.
> At this moment, I didn't check more (too much focused on the ncr 720 patch)
> but I just check on my hpux b180 and there  is any pb to read the cd. So
> either the drive is realy broken (but I already reach to burn and scan a
> full 600Mb cd-rwwith a previous kernel) or there is a pb with 53c7[01]0
> driver too?
> 
> James can you give us your opinion about this ?

I know of no outstanding problems with the 53c700 driver in the 2.6
kernel (and I use it all the time, since my other voyager has a D700
53c700-66 device for its root discs).

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
