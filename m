From: "Joel Soete" <soete.joel@scarlet.be>
Subject: ccio-dma: is issue could be related to too much io_tlb entries?
Date: Thu, 24 Jul 2008 14:13:55 +0100
Message-ID: <K4II37$FC5730FEE6DF5668DA61E723AC34CF60@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "kyle" <kyle@mcmartin.ca>,
	"linux-parisc" <linux-parisc@vger.kernel.org>
To: "grundler" <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello Grant, Kyle, et al.,

Iirc the number of io_tlb enties on this u2/uturn ioa is of 256?

Because issue occur only when I do a lot of I/O on scsi disk (sometime request
of mapping reach 128 pages), the idea was that it could induce some exceed of
iotlb entries.

I so turn on some STAT (just used_pages) and grab following data:
[snip]
IO PDIR size    : 131072 bytes (16384 entries)
IO PDIR entries : 16384 total  170 used (16214 free, 1%)
Resource bitmap : 2048 bytes (16384 pages)
  Bitmap search : 36221/36430/38793 (min/avg/max CPU Cycles)

IO PDIR size    : 131072 bytes (16384 entries)
IO PDIR entries : 16384 total  235 used (16149 free, 1%)
Resource bitmap : 2048 bytes (16384 pages)
  Bitmap search : 36220/36346/37806 (min/avg/max CPU Cycles)

IO PDIR size    : 131072 bytes (16384 entries)
IO PDIR entries : 16384 total  718 used (15666 free, 4%)
Resource bitmap : 2048 bytes (16384 pages)
  Bitmap search : 36222/36342/38472 (min/avg/max CPU Cycles)

## issue occurs just when I ready above message. 

IO PDIR size    : 131072 bytes (16384 entries)
IO PDIR entries : 16384 total  444 used (15940 free, 2%)
Resource bitmap : 2048 bytes (16384 pages)
  Bitmap search : 36220/36330/37830 (min/avg/max CPU Cycles)
[snip]

Even thought, I ended the stress test, the system continue to work smoothly
with 444 used entries?

Anyway, difference between those last 2 samples (718 - 444) = 274 increase of
io_pdir entries.

I also add a loop to bitcount entries of res_map and grab more:
[snip]
IO PDIR size    : 262144 bytes (32768 entries)  
IO PDIR entries : 32768 total  329 used (32439 free, 1%)
IO PDIR entries : 329 res_map_count
Resource bitmap : 4096 bytes (32768 pages)
  Bitmap search : 36221/36626/38310 (min/avg/max CPU Cycles)

IO PDIR size    : 262144 bytes (32768 entries)  
IO PDIR entries : 32768 total  801 used (31967 free, 2%)
IO PDIR entries : 801 res_map_count
Resource bitmap : 4096 bytes (32768 pages)
  Bitmap search : 36215/36325/37852 (min/avg/max CPU Cycles)

IO PDIR size    : 262144 bytes (32768 entries)  
IO PDIR entries : 32768 total  329 used (32439 free, 1%)
IO PDIR entries : 329 res_map_count
Resource bitmap : 4096 bytes (32768 pages)
  Bitmap search : 36222/36883/38742 (min/avg/max CPU Cycles)

[...]

(in 1 second 801 - 329 = 472)

But continuing a bit test (by accident), I noticed that system can survive with:

IO PDIR size    : 262144 bytes (32768 entries)
IO PDIR entries : 32768 total  1478 used (31290 free, 4%)
IO PDIR entries : 1478 res_map_count
Resource bitmap : 4096 bytes (32768 pages)
  Bitmap search : 36223/36696/38463 (min/avg/max CPU Cycles)

Well as scatterlist is still puzzling me, I can still be confused between
iommu and mmu pages mapping, sorry so in advance if it's yet another annoying
comment.

Tx again,
    J.





