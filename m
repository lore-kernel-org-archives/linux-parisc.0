From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Missing opcodes in PA 2.0
Date: Sun, 17 Jul 2005 10:31:25 -0400
Message-ID: <1121610685.5034.1.camel@mulgrave>
References: <200507162350.j6GNo79q012011@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200507162350.j6GNo79q012011@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 2005-07-16 at 19:50 -0400, John David Anglin wrote:
> I've been reviewing the opcode table for gas an noticed that the
> following opcodes appear to have disappeared from PA 2.0:
> 
> { "idtlba",     0x04001040, 0xfc00ffff, "x,(b)", pa10, 0},
> { "idtlba",     0x04001040, 0xfc003fff, "x,(s,b)", pa10, 0},
> { "iitlba",     0x04000040, 0xfc001fff, "x,(S,b)", pa10, 0},
> { "idtlbp",     0x04001000, 0xfc00ffff, "x,(b)", pa10, 0},
> { "idtlbp",     0x04001000, 0xfc003fff, "x,(s,b)", pa10, 0},
> { "iitlbp",     0x04000000, 0xfc001fff, "x,(S,b)", pa10, 0},
> 
> I'm interested in knowing if PA 2.0 processors still support these
> opcodes.

These I know ... the answer's no ... that's why we have pa1.1 and pa2.2
specific paths in the tlb miss handler.

The rest I've no idea

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
