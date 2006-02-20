From: Kyle McMartin <kyle@mcmartin.ca>
Subject: [parisc-linux] SMP_CALL_FUNCTION timeouts
Date: Mon, 20 Feb 2006 14:07:43 -0500
Message-ID: <20060220190743.GC15519@quicksilver.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
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

Hmm, I just saw this booting a dual 552MHz J6000:

FP[1] enabled: Rev 1 Model 16
migration_cost=2000
CPU(s): 2 x PA8600 (PCX-W+) at 552.000000 MHz
SMP CALL FUNCTION TIMED OUT! (cpu=0), try 1
SMP CALL FUNCTION TIMED OUT! (cpu=0), try 2
SMP CALL FUNCTION TIMED OUT! (cpu=0), try 3
SMP CALL FUNCTION TIMED OUT! (cpu=0), try 4
SMP CALL FUNCTION TIMED OUT! (cpu=0), try 5
SMP CALL FUNCTION TIMED OUT! (cpu=0), try 6
SMP CALL FUNCTION TIMED OUT! (cpu=0), try 7
SMP CALL FUNCTION TIMED OUT! (cpu=0), try 8
SMP CALL FUNCTION TIMED OUT! (cpu=0), try 9
SMP CALL FUNCTION TIMED OUT! (cpu=0), try 10
SMP CALL FUNCTION TIMED OUT! (cpu=0), try 11
SMP CALL FUNCTION TIMED OUT! (cpu=0), try 12
SMP CALL FUNCTION TIMED OUT! (cpu=0), try 13
SMP CALL FUNCTION TIMED OUT! (cpu=0), try 14
Setting cache flush threshold to 63134a00 (2 CPUs online)

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
