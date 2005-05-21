From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] ncr53c8xx 64bit verbose boot info
Date: Sat, 21 May 2005 15:59:26 +0100
Message-ID: <20050521145926.GH6857@parcelfarce.linux.theplanet.co.uk>
References: <4282FEEC00003588@mail-2-bnl.tiscali.it>
	<428F49E0.6070004@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@SteelEye.com>,
 PARISC list <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <428F49E0.6070004@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, May 21, 2005 at 02:46:56PM +0000, Joel Soete wrote:
> mmm strange in 32bit zalon_probe() used IRQ 67 while the 64bit used IRQ 66, 
> is that important?

No.  Interrupt numbers are now virtual and have no connection to how
interrupts are routed.  I'd expect them to be different between 32 and
64 bit kernels.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
