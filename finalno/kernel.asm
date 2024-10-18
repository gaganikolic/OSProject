
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000b117          	auipc	sp,0xb
    80000004:	7a813103          	ld	sp,1960(sp) # 8000b7a8 <_GLOBAL_OFFSET_TABLE_+0x50>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	76c060ef          	jal	ra,80006788 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <_ZN5Riscv14supervisorTrapEv>:
.global _ZN5Riscv14supervisorTrapEv
.align 4
.type _ZN5Riscv14supervisorTrapEv, @function

_ZN5Riscv14supervisorTrapEv:
    j softwareInterrupt
    80001000:	0280006f          	j	80001028 <softwareInterrupt>
    j timerInterrupt
    80001004:	12c0006f          	j	80001130 <timerInterrupt>
    j ret
    80001008:	3480006f          	j	80001350 <ret>
    j ret
    8000100c:	3440006f          	j	80001350 <ret>
    j ret
    80001010:	3400006f          	j	80001350 <ret>
    j ret
    80001014:	33c0006f          	j	80001350 <ret>
    j ret
    80001018:	3380006f          	j	80001350 <ret>
    j ret
    8000101c:	3340006f          	j	80001350 <ret>
    j ret
    80001020:	3300006f          	j	80001350 <ret>
    j consoleInterrupt
    80001024:	21c0006f          	j	80001240 <consoleInterrupt>

0000000080001028 <softwareInterrupt>:

softwareInterrupt:
    # push all registers to stack
    addi sp, sp, -256
    80001028:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    8000102c:	00013023          	sd	zero,0(sp)
    80001030:	00113423          	sd	ra,8(sp)
    80001034:	00213823          	sd	sp,16(sp)
    80001038:	00313c23          	sd	gp,24(sp)
    8000103c:	02413023          	sd	tp,32(sp)
    80001040:	02513423          	sd	t0,40(sp)
    80001044:	02613823          	sd	t1,48(sp)
    80001048:	02713c23          	sd	t2,56(sp)
    8000104c:	04813023          	sd	s0,64(sp)
    80001050:	04913423          	sd	s1,72(sp)
    80001054:	04b13c23          	sd	a1,88(sp)
    80001058:	06c13023          	sd	a2,96(sp)
    8000105c:	06d13423          	sd	a3,104(sp)
    80001060:	06e13823          	sd	a4,112(sp)
    80001064:	06f13c23          	sd	a5,120(sp)
    80001068:	09013023          	sd	a6,128(sp)
    8000106c:	09113423          	sd	a7,136(sp)
    80001070:	09213823          	sd	s2,144(sp)
    80001074:	09313c23          	sd	s3,152(sp)
    80001078:	0b413023          	sd	s4,160(sp)
    8000107c:	0b513423          	sd	s5,168(sp)
    80001080:	0b613823          	sd	s6,176(sp)
    80001084:	0b713c23          	sd	s7,184(sp)
    80001088:	0d813023          	sd	s8,192(sp)
    8000108c:	0d913423          	sd	s9,200(sp)
    80001090:	0da13823          	sd	s10,208(sp)
    80001094:	0db13c23          	sd	s11,216(sp)
    80001098:	0fc13023          	sd	t3,224(sp)
    8000109c:	0fd13423          	sd	t4,232(sp)
    800010a0:	0fe13823          	sd	t5,240(sp)
    800010a4:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv15handleInterruptEv
    800010a8:	700010ef          	jal	ra,800027a8 <_ZN5Riscv15handleInterruptEv>

    # pop all registers from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800010ac:	00013003          	ld	zero,0(sp)
    800010b0:	00813083          	ld	ra,8(sp)
    800010b4:	01013103          	ld	sp,16(sp)
    800010b8:	01813183          	ld	gp,24(sp)
    800010bc:	02013203          	ld	tp,32(sp)
    800010c0:	02813283          	ld	t0,40(sp)
    800010c4:	03013303          	ld	t1,48(sp)
    800010c8:	03813383          	ld	t2,56(sp)
    800010cc:	04013403          	ld	s0,64(sp)
    800010d0:	04813483          	ld	s1,72(sp)
    800010d4:	05813583          	ld	a1,88(sp)
    800010d8:	06013603          	ld	a2,96(sp)
    800010dc:	06813683          	ld	a3,104(sp)
    800010e0:	07013703          	ld	a4,112(sp)
    800010e4:	07813783          	ld	a5,120(sp)
    800010e8:	08013803          	ld	a6,128(sp)
    800010ec:	08813883          	ld	a7,136(sp)
    800010f0:	09013903          	ld	s2,144(sp)
    800010f4:	09813983          	ld	s3,152(sp)
    800010f8:	0a013a03          	ld	s4,160(sp)
    800010fc:	0a813a83          	ld	s5,168(sp)
    80001100:	0b013b03          	ld	s6,176(sp)
    80001104:	0b813b83          	ld	s7,184(sp)
    80001108:	0c013c03          	ld	s8,192(sp)
    8000110c:	0c813c83          	ld	s9,200(sp)
    80001110:	0d013d03          	ld	s10,208(sp)
    80001114:	0d813d83          	ld	s11,216(sp)
    80001118:	0e013e03          	ld	t3,224(sp)
    8000111c:	0e813e83          	ld	t4,232(sp)
    80001120:	0f013f03          	ld	t5,240(sp)
    80001124:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001128:	10010113          	addi	sp,sp,256

    sret
    8000112c:	10200073          	sret

0000000080001130 <timerInterrupt>:

timerInterrupt:
    # push all registers to stack
    addi sp, sp, -256
    80001130:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001134:	00013023          	sd	zero,0(sp)
    80001138:	00113423          	sd	ra,8(sp)
    8000113c:	00213823          	sd	sp,16(sp)
    80001140:	00313c23          	sd	gp,24(sp)
    80001144:	02413023          	sd	tp,32(sp)
    80001148:	02513423          	sd	t0,40(sp)
    8000114c:	02613823          	sd	t1,48(sp)
    80001150:	02713c23          	sd	t2,56(sp)
    80001154:	04813023          	sd	s0,64(sp)
    80001158:	04913423          	sd	s1,72(sp)
    8000115c:	04a13823          	sd	a0,80(sp)
    80001160:	04b13c23          	sd	a1,88(sp)
    80001164:	06c13023          	sd	a2,96(sp)
    80001168:	06d13423          	sd	a3,104(sp)
    8000116c:	06e13823          	sd	a4,112(sp)
    80001170:	06f13c23          	sd	a5,120(sp)
    80001174:	09013023          	sd	a6,128(sp)
    80001178:	09113423          	sd	a7,136(sp)
    8000117c:	09213823          	sd	s2,144(sp)
    80001180:	09313c23          	sd	s3,152(sp)
    80001184:	0b413023          	sd	s4,160(sp)
    80001188:	0b513423          	sd	s5,168(sp)
    8000118c:	0b613823          	sd	s6,176(sp)
    80001190:	0b713c23          	sd	s7,184(sp)
    80001194:	0d813023          	sd	s8,192(sp)
    80001198:	0d913423          	sd	s9,200(sp)
    8000119c:	0da13823          	sd	s10,208(sp)
    800011a0:	0db13c23          	sd	s11,216(sp)
    800011a4:	0fc13023          	sd	t3,224(sp)
    800011a8:	0fd13423          	sd	t4,232(sp)
    800011ac:	0fe13823          	sd	t5,240(sp)
    800011b0:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv11handleTimerEv
    800011b4:	0c9010ef          	jal	ra,80002a7c <_ZN5Riscv11handleTimerEv>

    # pop all registers from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800011b8:	00013003          	ld	zero,0(sp)
    800011bc:	00813083          	ld	ra,8(sp)
    800011c0:	01013103          	ld	sp,16(sp)
    800011c4:	01813183          	ld	gp,24(sp)
    800011c8:	02013203          	ld	tp,32(sp)
    800011cc:	02813283          	ld	t0,40(sp)
    800011d0:	03013303          	ld	t1,48(sp)
    800011d4:	03813383          	ld	t2,56(sp)
    800011d8:	04013403          	ld	s0,64(sp)
    800011dc:	04813483          	ld	s1,72(sp)
    800011e0:	05013503          	ld	a0,80(sp)
    800011e4:	05813583          	ld	a1,88(sp)
    800011e8:	06013603          	ld	a2,96(sp)
    800011ec:	06813683          	ld	a3,104(sp)
    800011f0:	07013703          	ld	a4,112(sp)
    800011f4:	07813783          	ld	a5,120(sp)
    800011f8:	08013803          	ld	a6,128(sp)
    800011fc:	08813883          	ld	a7,136(sp)
    80001200:	09013903          	ld	s2,144(sp)
    80001204:	09813983          	ld	s3,152(sp)
    80001208:	0a013a03          	ld	s4,160(sp)
    8000120c:	0a813a83          	ld	s5,168(sp)
    80001210:	0b013b03          	ld	s6,176(sp)
    80001214:	0b813b83          	ld	s7,184(sp)
    80001218:	0c013c03          	ld	s8,192(sp)
    8000121c:	0c813c83          	ld	s9,200(sp)
    80001220:	0d013d03          	ld	s10,208(sp)
    80001224:	0d813d83          	ld	s11,216(sp)
    80001228:	0e013e03          	ld	t3,224(sp)
    8000122c:	0e813e83          	ld	t4,232(sp)
    80001230:	0f013f03          	ld	t5,240(sp)
    80001234:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001238:	10010113          	addi	sp,sp,256

    sret
    8000123c:	10200073          	sret

0000000080001240 <consoleInterrupt>:

consoleInterrupt:
    # push all registers to stack
    addi sp, sp, -256
    80001240:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001244:	00013023          	sd	zero,0(sp)
    80001248:	00113423          	sd	ra,8(sp)
    8000124c:	00213823          	sd	sp,16(sp)
    80001250:	00313c23          	sd	gp,24(sp)
    80001254:	02413023          	sd	tp,32(sp)
    80001258:	02513423          	sd	t0,40(sp)
    8000125c:	02613823          	sd	t1,48(sp)
    80001260:	02713c23          	sd	t2,56(sp)
    80001264:	04813023          	sd	s0,64(sp)
    80001268:	04913423          	sd	s1,72(sp)
    8000126c:	04a13823          	sd	a0,80(sp)
    80001270:	04b13c23          	sd	a1,88(sp)
    80001274:	06c13023          	sd	a2,96(sp)
    80001278:	06d13423          	sd	a3,104(sp)
    8000127c:	06e13823          	sd	a4,112(sp)
    80001280:	06f13c23          	sd	a5,120(sp)
    80001284:	09013023          	sd	a6,128(sp)
    80001288:	09113423          	sd	a7,136(sp)
    8000128c:	09213823          	sd	s2,144(sp)
    80001290:	09313c23          	sd	s3,152(sp)
    80001294:	0b413023          	sd	s4,160(sp)
    80001298:	0b513423          	sd	s5,168(sp)
    8000129c:	0b613823          	sd	s6,176(sp)
    800012a0:	0b713c23          	sd	s7,184(sp)
    800012a4:	0d813023          	sd	s8,192(sp)
    800012a8:	0d913423          	sd	s9,200(sp)
    800012ac:	0da13823          	sd	s10,208(sp)
    800012b0:	0db13c23          	sd	s11,216(sp)
    800012b4:	0fc13023          	sd	t3,224(sp)
    800012b8:	0fd13423          	sd	t4,232(sp)
    800012bc:	0fe13823          	sd	t5,240(sp)
    800012c0:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv13handleConsoleEv
    800012c4:	051010ef          	jal	ra,80002b14 <_ZN5Riscv13handleConsoleEv>

    # pop all registers from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800012c8:	00013003          	ld	zero,0(sp)
    800012cc:	00813083          	ld	ra,8(sp)
    800012d0:	01013103          	ld	sp,16(sp)
    800012d4:	01813183          	ld	gp,24(sp)
    800012d8:	02013203          	ld	tp,32(sp)
    800012dc:	02813283          	ld	t0,40(sp)
    800012e0:	03013303          	ld	t1,48(sp)
    800012e4:	03813383          	ld	t2,56(sp)
    800012e8:	04013403          	ld	s0,64(sp)
    800012ec:	04813483          	ld	s1,72(sp)
    800012f0:	05013503          	ld	a0,80(sp)
    800012f4:	05813583          	ld	a1,88(sp)
    800012f8:	06013603          	ld	a2,96(sp)
    800012fc:	06813683          	ld	a3,104(sp)
    80001300:	07013703          	ld	a4,112(sp)
    80001304:	07813783          	ld	a5,120(sp)
    80001308:	08013803          	ld	a6,128(sp)
    8000130c:	08813883          	ld	a7,136(sp)
    80001310:	09013903          	ld	s2,144(sp)
    80001314:	09813983          	ld	s3,152(sp)
    80001318:	0a013a03          	ld	s4,160(sp)
    8000131c:	0a813a83          	ld	s5,168(sp)
    80001320:	0b013b03          	ld	s6,176(sp)
    80001324:	0b813b83          	ld	s7,184(sp)
    80001328:	0c013c03          	ld	s8,192(sp)
    8000132c:	0c813c83          	ld	s9,200(sp)
    80001330:	0d013d03          	ld	s10,208(sp)
    80001334:	0d813d83          	ld	s11,216(sp)
    80001338:	0e013e03          	ld	t3,224(sp)
    8000133c:	0e813e83          	ld	t4,232(sp)
    80001340:	0f013f03          	ld	t5,240(sp)
    80001344:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001348:	10010113          	addi	sp,sp,256

    sret
    8000134c:	10200073          	sret

0000000080001350 <ret>:

ret:
    80001350:	10200073          	sret
    80001354:	0000                	unimp
	...

0000000080001358 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:
.global _ZN3TCB13contextSwitchEPNS_7ContextES1_
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
    sd ra, 0 * 8(a0)
    80001358:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0)
    8000135c:	00253423          	sd	sp,8(a0)

    ld ra, 0 * 8(a1)
    80001360:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    80001364:	0085b103          	ld	sp,8(a1)

    80001368:	00008067          	ret

000000008000136c <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    8000136c:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001370:	00b29a63          	bne	t0,a1,80001384 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001374:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001378:	fe029ae3          	bnez	t0,8000136c <copy_and_swap>
    li a0, 0               # Set return to success.
    8000137c:	00000513          	li	a0,0
    jr ra                  # Return.
    80001380:	00008067          	ret

0000000080001384 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001384:	00100513          	li	a0,1
    80001388:	00008067          	ret

000000008000138c <_Z8syscallWz>:
void changeToUser(){
    syscallW(0x43);
    return;
}

void syscallW(...){
    8000138c:	ff010113          	addi	sp,sp,-16
    80001390:	00813423          	sd	s0,8(sp)
    80001394:	01010413          	addi	s0,sp,16
    __asm__ volatile ("ecall");
    80001398:	00000073          	ecall
    8000139c:	00813403          	ld	s0,8(sp)
    800013a0:	01010113          	addi	sp,sp,16
    800013a4:	00008067          	ret

00000000800013a8 <_Z9mem_allocm>:
void* mem_alloc(size_t size){
    800013a8:	fe010113          	addi	sp,sp,-32
    800013ac:	00113c23          	sd	ra,24(sp)
    800013b0:	00813823          	sd	s0,16(sp)
    800013b4:	02010413          	addi	s0,sp,32
    uint64 blks = (size + MEM_BLOCK_SIZE - 1 )/MEM_BLOCK_SIZE;
    800013b8:	03f50593          	addi	a1,a0,63
    syscallW(0x01, blks);
    800013bc:	0065d593          	srli	a1,a1,0x6
    800013c0:	00100513          	li	a0,1
    800013c4:	00000097          	auipc	ra,0x0
    800013c8:	fc8080e7          	jalr	-56(ra) # 8000138c <_Z8syscallWz>
}

inline uint64 Riscv::r_a0()
{
    uint64 volatile a0;
    __asm__ volatile ("mv %[a0], a0" : [a0] "=r"(a0));
    800013cc:	00050793          	mv	a5,a0
    800013d0:	fef43423          	sd	a5,-24(s0)
    return a0;
    800013d4:	fe843503          	ld	a0,-24(s0)
}
    800013d8:	01813083          	ld	ra,24(sp)
    800013dc:	01013403          	ld	s0,16(sp)
    800013e0:	02010113          	addi	sp,sp,32
    800013e4:	00008067          	ret

00000000800013e8 <_Z8mem_freePv>:
int mem_free(void* ptr){
    800013e8:	fe010113          	addi	sp,sp,-32
    800013ec:	00113c23          	sd	ra,24(sp)
    800013f0:	00813823          	sd	s0,16(sp)
    800013f4:	02010413          	addi	s0,sp,32
    800013f8:	00050593          	mv	a1,a0
    syscallW(0x02, ptr);
    800013fc:	00200513          	li	a0,2
    80001400:	00000097          	auipc	ra,0x0
    80001404:	f8c080e7          	jalr	-116(ra) # 8000138c <_Z8syscallWz>
    __asm__ volatile ("mv %[a0], a0" : [a0] "=r"(a0));
    80001408:	00050793          	mv	a5,a0
    8000140c:	fef43423          	sd	a5,-24(s0)
    return a0;
    80001410:	fe843503          	ld	a0,-24(s0)
}
    80001414:	0005051b          	sext.w	a0,a0
    80001418:	01813083          	ld	ra,24(sp)
    8000141c:	01013403          	ld	s0,16(sp)
    80001420:	02010113          	addi	sp,sp,32
    80001424:	00008067          	ret

0000000080001428 <_Z13thread_createPP3TCBPFvPvES2_>:
int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg){
    80001428:	fe010113          	addi	sp,sp,-32
    8000142c:	00113c23          	sd	ra,24(sp)
    80001430:	00813823          	sd	s0,16(sp)
    80001434:	02010413          	addi	s0,sp,32
    80001438:	00060693          	mv	a3,a2
    syscallW(0x11, handle, start_routine, arg);
    8000143c:	00058613          	mv	a2,a1
    80001440:	00050593          	mv	a1,a0
    80001444:	01100513          	li	a0,17
    80001448:	00000097          	auipc	ra,0x0
    8000144c:	f44080e7          	jalr	-188(ra) # 8000138c <_Z8syscallWz>
    __asm__ volatile ("mv %[a0], a0" : [a0] "=r"(a0));
    80001450:	00050793          	mv	a5,a0
    80001454:	fef43423          	sd	a5,-24(s0)
    return a0;
    80001458:	fe843783          	ld	a5,-24(s0)
    if(!ret) return -1;
    8000145c:	00078c63          	beqz	a5,80001474 <_Z13thread_createPP3TCBPFvPvES2_+0x4c>
    return 0;
    80001460:	00000513          	li	a0,0
}
    80001464:	01813083          	ld	ra,24(sp)
    80001468:	01013403          	ld	s0,16(sp)
    8000146c:	02010113          	addi	sp,sp,32
    80001470:	00008067          	ret
    if(!ret) return -1;
    80001474:	fff00513          	li	a0,-1
    80001478:	fedff06f          	j	80001464 <_Z13thread_createPP3TCBPFvPvES2_+0x3c>

000000008000147c <_Z16thread_create_noPP3TCBPFvPvES2_>:
int thread_create_no(thread_t* handle, void(*start_routine)(void*), void* arg){
    8000147c:	fe010113          	addi	sp,sp,-32
    80001480:	00113c23          	sd	ra,24(sp)
    80001484:	00813823          	sd	s0,16(sp)
    80001488:	02010413          	addi	s0,sp,32
    8000148c:	00060693          	mv	a3,a2
    syscallW(0x15, handle, start_routine, arg);
    80001490:	00058613          	mv	a2,a1
    80001494:	00050593          	mv	a1,a0
    80001498:	01500513          	li	a0,21
    8000149c:	00000097          	auipc	ra,0x0
    800014a0:	ef0080e7          	jalr	-272(ra) # 8000138c <_Z8syscallWz>
    __asm__ volatile ("mv %[a0], a0" : [a0] "=r"(a0));
    800014a4:	00050793          	mv	a5,a0
    800014a8:	fef43423          	sd	a5,-24(s0)
    return a0;
    800014ac:	fe843783          	ld	a5,-24(s0)
    if(!ret) return -1;
    800014b0:	00078c63          	beqz	a5,800014c8 <_Z16thread_create_noPP3TCBPFvPvES2_+0x4c>
    return 0;
    800014b4:	00000513          	li	a0,0
}
    800014b8:	01813083          	ld	ra,24(sp)
    800014bc:	01013403          	ld	s0,16(sp)
    800014c0:	02010113          	addi	sp,sp,32
    800014c4:	00008067          	ret
    if(!ret) return -1;
    800014c8:	fff00513          	li	a0,-1
    800014cc:	fedff06f          	j	800014b8 <_Z16thread_create_noPP3TCBPFvPvES2_+0x3c>

00000000800014d0 <_Z11thread_exitv>:
int thread_exit(){
    800014d0:	fe010113          	addi	sp,sp,-32
    800014d4:	00113c23          	sd	ra,24(sp)
    800014d8:	00813823          	sd	s0,16(sp)
    800014dc:	02010413          	addi	s0,sp,32
    syscallW(0x12);
    800014e0:	01200513          	li	a0,18
    800014e4:	00000097          	auipc	ra,0x0
    800014e8:	ea8080e7          	jalr	-344(ra) # 8000138c <_Z8syscallWz>
    __asm__ volatile ("mv %[a0], a0" : [a0] "=r"(a0));
    800014ec:	00050793          	mv	a5,a0
    800014f0:	fef43423          	sd	a5,-24(s0)
    return a0;
    800014f4:	fe843503          	ld	a0,-24(s0)
}
    800014f8:	0005051b          	sext.w	a0,a0
    800014fc:	01813083          	ld	ra,24(sp)
    80001500:	01013403          	ld	s0,16(sp)
    80001504:	02010113          	addi	sp,sp,32
    80001508:	00008067          	ret

000000008000150c <_Z15thread_dispatchv>:
void thread_dispatch(){
    8000150c:	ff010113          	addi	sp,sp,-16
    80001510:	00113423          	sd	ra,8(sp)
    80001514:	00813023          	sd	s0,0(sp)
    80001518:	01010413          	addi	s0,sp,16
    syscallW(0x13);
    8000151c:	01300513          	li	a0,19
    80001520:	00000097          	auipc	ra,0x0
    80001524:	e6c080e7          	jalr	-404(ra) # 8000138c <_Z8syscallWz>
}
    80001528:	00813083          	ld	ra,8(sp)
    8000152c:	00013403          	ld	s0,0(sp)
    80001530:	01010113          	addi	sp,sp,16
    80001534:	00008067          	ret

0000000080001538 <_Z11thread_joinP3TCB>:
    if(!handle) return;
    80001538:	02050a63          	beqz	a0,8000156c <_Z11thread_joinP3TCB+0x34>
void thread_join(TCB* handle){
    8000153c:	ff010113          	addi	sp,sp,-16
    80001540:	00113423          	sd	ra,8(sp)
    80001544:	00813023          	sd	s0,0(sp)
    80001548:	01010413          	addi	s0,sp,16
    8000154c:	00050593          	mv	a1,a0
    syscallW(0x14, handle);
    80001550:	01400513          	li	a0,20
    80001554:	00000097          	auipc	ra,0x0
    80001558:	e38080e7          	jalr	-456(ra) # 8000138c <_Z8syscallWz>
}
    8000155c:	00813083          	ld	ra,8(sp)
    80001560:	00013403          	ld	s0,0(sp)
    80001564:	01010113          	addi	sp,sp,16
    80001568:	00008067          	ret
    8000156c:	00008067          	ret

0000000080001570 <_Z10time_sleepm>:
int time_sleep(time_t timeSleep){
    80001570:	ff010113          	addi	sp,sp,-16
    80001574:	00113423          	sd	ra,8(sp)
    80001578:	00813023          	sd	s0,0(sp)
    8000157c:	01010413          	addi	s0,sp,16
    80001580:	00050593          	mv	a1,a0
    syscallW(0x31, timeSleep);
    80001584:	03100513          	li	a0,49
    80001588:	00000097          	auipc	ra,0x0
    8000158c:	e04080e7          	jalr	-508(ra) # 8000138c <_Z8syscallWz>
}
    80001590:	00000513          	li	a0,0
    80001594:	00813083          	ld	ra,8(sp)
    80001598:	00013403          	ld	s0,0(sp)
    8000159c:	01010113          	addi	sp,sp,16
    800015a0:	00008067          	ret

00000000800015a4 <_Z8sem_openPP9semaphorej>:
    if(!handle) return -1;
    800015a4:	04050663          	beqz	a0,800015f0 <_Z8sem_openPP9semaphorej+0x4c>
int sem_open(sem_t* handle, unsigned init){
    800015a8:	fe010113          	addi	sp,sp,-32
    800015ac:	00113c23          	sd	ra,24(sp)
    800015b0:	00813823          	sd	s0,16(sp)
    800015b4:	02010413          	addi	s0,sp,32
    800015b8:	00058613          	mv	a2,a1
    syscallW(0x21, handle, init);
    800015bc:	00050593          	mv	a1,a0
    800015c0:	02100513          	li	a0,33
    800015c4:	00000097          	auipc	ra,0x0
    800015c8:	dc8080e7          	jalr	-568(ra) # 8000138c <_Z8syscallWz>
    __asm__ volatile ("mv %[a0], a0" : [a0] "=r"(a0));
    800015cc:	00050793          	mv	a5,a0
    800015d0:	fef43423          	sd	a5,-24(s0)
    return a0;
    800015d4:	fe843783          	ld	a5,-24(s0)
    if(!ret) return -1;
    800015d8:	02078063          	beqz	a5,800015f8 <_Z8sem_openPP9semaphorej+0x54>
    return 0;
    800015dc:	00000513          	li	a0,0
}
    800015e0:	01813083          	ld	ra,24(sp)
    800015e4:	01013403          	ld	s0,16(sp)
    800015e8:	02010113          	addi	sp,sp,32
    800015ec:	00008067          	ret
    if(!handle) return -1;
    800015f0:	fff00513          	li	a0,-1
}
    800015f4:	00008067          	ret
    if(!ret) return -1;
    800015f8:	fff00513          	li	a0,-1
    800015fc:	fe5ff06f          	j	800015e0 <_Z8sem_openPP9semaphorej+0x3c>

0000000080001600 <_Z9sem_closeP9semaphore>:
    if(!handle) return -1;
    80001600:	04050263          	beqz	a0,80001644 <_Z9sem_closeP9semaphore+0x44>
int sem_close(sem_t handle){
    80001604:	fe010113          	addi	sp,sp,-32
    80001608:	00113c23          	sd	ra,24(sp)
    8000160c:	00813823          	sd	s0,16(sp)
    80001610:	02010413          	addi	s0,sp,32
    80001614:	00050593          	mv	a1,a0
    syscallW(0x22, handle);
    80001618:	02200513          	li	a0,34
    8000161c:	00000097          	auipc	ra,0x0
    80001620:	d70080e7          	jalr	-656(ra) # 8000138c <_Z8syscallWz>
    __asm__ volatile ("mv %[a0], a0" : [a0] "=r"(a0));
    80001624:	00050793          	mv	a5,a0
    80001628:	fef43423          	sd	a5,-24(s0)
    return a0;
    8000162c:	fe843503          	ld	a0,-24(s0)
    int ret = Riscv::r_a0();
    80001630:	0005051b          	sext.w	a0,a0
}
    80001634:	01813083          	ld	ra,24(sp)
    80001638:	01013403          	ld	s0,16(sp)
    8000163c:	02010113          	addi	sp,sp,32
    80001640:	00008067          	ret
    if(!handle) return -1;
    80001644:	fff00513          	li	a0,-1
}
    80001648:	00008067          	ret

000000008000164c <_Z8sem_waitP9semaphore>:
    if(!handle) return -1;
    8000164c:	04050263          	beqz	a0,80001690 <_Z8sem_waitP9semaphore+0x44>
int sem_wait(sem_t handle){
    80001650:	fe010113          	addi	sp,sp,-32
    80001654:	00113c23          	sd	ra,24(sp)
    80001658:	00813823          	sd	s0,16(sp)
    8000165c:	02010413          	addi	s0,sp,32
    80001660:	00050593          	mv	a1,a0
    syscallW(0x23, handle);
    80001664:	02300513          	li	a0,35
    80001668:	00000097          	auipc	ra,0x0
    8000166c:	d24080e7          	jalr	-732(ra) # 8000138c <_Z8syscallWz>
    __asm__ volatile ("mv %[a0], a0" : [a0] "=r"(a0));
    80001670:	00050793          	mv	a5,a0
    80001674:	fef43423          	sd	a5,-24(s0)
    return a0;
    80001678:	fe843503          	ld	a0,-24(s0)
    int ret = Riscv::r_a0();
    8000167c:	0005051b          	sext.w	a0,a0
}
    80001680:	01813083          	ld	ra,24(sp)
    80001684:	01013403          	ld	s0,16(sp)
    80001688:	02010113          	addi	sp,sp,32
    8000168c:	00008067          	ret
    if(!handle) return -1;
    80001690:	fff00513          	li	a0,-1
}
    80001694:	00008067          	ret

0000000080001698 <_Z10sem_signalP9semaphore>:
    if(!handle) return -1;
    80001698:	04050263          	beqz	a0,800016dc <_Z10sem_signalP9semaphore+0x44>
int sem_signal(sem_t handle){
    8000169c:	fe010113          	addi	sp,sp,-32
    800016a0:	00113c23          	sd	ra,24(sp)
    800016a4:	00813823          	sd	s0,16(sp)
    800016a8:	02010413          	addi	s0,sp,32
    800016ac:	00050593          	mv	a1,a0
    syscallW(0x24, handle);
    800016b0:	02400513          	li	a0,36
    800016b4:	00000097          	auipc	ra,0x0
    800016b8:	cd8080e7          	jalr	-808(ra) # 8000138c <_Z8syscallWz>
    __asm__ volatile ("mv %[a0], a0" : [a0] "=r"(a0));
    800016bc:	00050793          	mv	a5,a0
    800016c0:	fef43423          	sd	a5,-24(s0)
    return a0;
    800016c4:	fe843503          	ld	a0,-24(s0)
    int ret = Riscv::r_a0();
    800016c8:	0005051b          	sext.w	a0,a0
}
    800016cc:	01813083          	ld	ra,24(sp)
    800016d0:	01013403          	ld	s0,16(sp)
    800016d4:	02010113          	addi	sp,sp,32
    800016d8:	00008067          	ret
    if(!handle) return -1;
    800016dc:	fff00513          	li	a0,-1
}
    800016e0:	00008067          	ret

00000000800016e4 <_Z4getcv>:
char getc(){
    800016e4:	fe010113          	addi	sp,sp,-32
    800016e8:	00113c23          	sd	ra,24(sp)
    800016ec:	00813823          	sd	s0,16(sp)
    800016f0:	02010413          	addi	s0,sp,32
    syscallW(0x41);
    800016f4:	04100513          	li	a0,65
    800016f8:	00000097          	auipc	ra,0x0
    800016fc:	c94080e7          	jalr	-876(ra) # 8000138c <_Z8syscallWz>
    __asm__ volatile ("mv %[a0], a0" : [a0] "=r"(a0));
    80001700:	00050793          	mv	a5,a0
    80001704:	fef43423          	sd	a5,-24(s0)
    return a0;
    80001708:	fe843503          	ld	a0,-24(s0)
}
    8000170c:	0ff57513          	andi	a0,a0,255
    80001710:	01813083          	ld	ra,24(sp)
    80001714:	01013403          	ld	s0,16(sp)
    80001718:	02010113          	addi	sp,sp,32
    8000171c:	00008067          	ret

0000000080001720 <_Z4putcc>:
void putc(char c){
    80001720:	ff010113          	addi	sp,sp,-16
    80001724:	00113423          	sd	ra,8(sp)
    80001728:	00813023          	sd	s0,0(sp)
    8000172c:	01010413          	addi	s0,sp,16
    80001730:	00050593          	mv	a1,a0
    syscallW(0x42, c);
    80001734:	04200513          	li	a0,66
    80001738:	00000097          	auipc	ra,0x0
    8000173c:	c54080e7          	jalr	-940(ra) # 8000138c <_Z8syscallWz>
}
    80001740:	00813083          	ld	ra,8(sp)
    80001744:	00013403          	ld	s0,0(sp)
    80001748:	01010113          	addi	sp,sp,16
    8000174c:	00008067          	ret

0000000080001750 <_Z12changeToUserv>:
void changeToUser(){
    80001750:	ff010113          	addi	sp,sp,-16
    80001754:	00113423          	sd	ra,8(sp)
    80001758:	00813023          	sd	s0,0(sp)
    8000175c:	01010413          	addi	s0,sp,16
    syscallW(0x43);
    80001760:	04300513          	li	a0,67
    80001764:	00000097          	auipc	ra,0x0
    80001768:	c28080e7          	jalr	-984(ra) # 8000138c <_Z8syscallWz>
}
    8000176c:	00813083          	ld	ra,8(sp)
    80001770:	00013403          	ld	s0,0(sp)
    80001774:	01010113          	addi	sp,sp,16
    80001778:	00008067          	ret

000000008000177c <_ZN9semaphoreC1Ei>:
#include "../h/semaphore.hpp"

semaphore::semaphore(int status){
    8000177c:	ff010113          	addi	sp,sp,-16
    80001780:	00813423          	sd	s0,8(sp)
    80001784:	01010413          	addi	s0,sp,16
    this->status = status;
    80001788:	00b52023          	sw	a1,0(a0)
    head = nullptr;
    8000178c:	00053423          	sd	zero,8(a0)
    tail = nullptr;
    80001790:	00053823          	sd	zero,16(a0)
}
    80001794:	00813403          	ld	s0,8(sp)
    80001798:	01010113          	addi	sp,sp,16
    8000179c:	00008067          	ret

00000000800017a0 <_ZN9semaphore4openEi>:

semaphore* semaphore::open(int init){
    800017a0:	fe010113          	addi	sp,sp,-32
    800017a4:	00113c23          	sd	ra,24(sp)
    800017a8:	00813823          	sd	s0,16(sp)
    800017ac:	00913423          	sd	s1,8(sp)
    800017b0:	02010413          	addi	s0,sp,32
    800017b4:	00050493          	mv	s1,a0
    semaphore* sem = (semaphore*) MemoryAllocator::instance().mem_alloc((sizeof(semaphore) + MEM_BLOCK_SIZE - 1)/MEM_BLOCK_SIZE);
    800017b8:	00001097          	auipc	ra,0x1
    800017bc:	454080e7          	jalr	1108(ra) # 80002c0c <_ZN15MemoryAllocator8instanceEv>
    800017c0:	00100593          	li	a1,1
    800017c4:	00001097          	auipc	ra,0x1
    800017c8:	50c080e7          	jalr	1292(ra) # 80002cd0 <_ZN15MemoryAllocator9mem_allocEm>
    sem->status = init;
    800017cc:	00952023          	sw	s1,0(a0)
    sem->head = nullptr;
    800017d0:	00053423          	sd	zero,8(a0)
    sem->tail = nullptr;
    800017d4:	00053823          	sd	zero,16(a0)
    return sem;
}
    800017d8:	01813083          	ld	ra,24(sp)
    800017dc:	01013403          	ld	s0,16(sp)
    800017e0:	00813483          	ld	s1,8(sp)
    800017e4:	02010113          	addi	sp,sp,32
    800017e8:	00008067          	ret

00000000800017ec <_ZN9semaphore5closeEv>:

int semaphore::close(){
    800017ec:	fe010113          	addi	sp,sp,-32
    800017f0:	00113c23          	sd	ra,24(sp)
    800017f4:	00813823          	sd	s0,16(sp)
    800017f8:	00913423          	sd	s1,8(sp)
    800017fc:	01213023          	sd	s2,0(sp)
    80001800:	02010413          	addi	s0,sp,32
    80001804:	00050493          	mv	s1,a0
    while(head){
    80001808:	0084b503          	ld	a0,8(s1)
    8000180c:	02050c63          	beqz	a0,80001844 <_ZN9semaphore5closeEv+0x58>
        Blocked* removed = head;
        TCB* t = removed->thread;
    80001810:	00053903          	ld	s2,0(a0)
    static void sleep(time_t timeToSleep);

    bool isFinished() const { return finished; }
    void setFinished(bool value) { finished = value; }
    bool isBlocked() const { return blocked; }
    void setBlocked(bool value) { blocked = value; }
    80001814:	020904a3          	sb	zero,41(s2)
        t->setBlocked(false);

        mem_free(removed);
    80001818:	00000097          	auipc	ra,0x0
    8000181c:	bd0080e7          	jalr	-1072(ra) # 800013e8 <_Z8mem_freePv>
        Scheduler::instanceOfScheduler().put(t);
    80001820:	00000097          	auipc	ra,0x0
    80001824:	1b4080e7          	jalr	436(ra) # 800019d4 <_ZN9Scheduler19instanceOfSchedulerEv>
    80001828:	00090593          	mv	a1,s2
    8000182c:	00000097          	auipc	ra,0x0
    80001830:	1c8080e7          	jalr	456(ra) # 800019f4 <_ZN9Scheduler3putEP3TCB>
        head = head->next;
    80001834:	0084b783          	ld	a5,8(s1)
    80001838:	0087b783          	ld	a5,8(a5)
    8000183c:	00f4b423          	sd	a5,8(s1)
    while(head){
    80001840:	fc9ff06f          	j	80001808 <_ZN9semaphore5closeEv+0x1c>
    }
    return 0;
}
    80001844:	00000513          	li	a0,0
    80001848:	01813083          	ld	ra,24(sp)
    8000184c:	01013403          	ld	s0,16(sp)
    80001850:	00813483          	ld	s1,8(sp)
    80001854:	00013903          	ld	s2,0(sp)
    80001858:	02010113          	addi	sp,sp,32
    8000185c:	00008067          	ret

0000000080001860 <_ZN9semaphore6signalEv>:

int semaphore::signal(){
    if(++status <= 0){
    80001860:	00052783          	lw	a5,0(a0)
    80001864:	0017879b          	addiw	a5,a5,1
    80001868:	0007871b          	sext.w	a4,a5
    8000186c:	00f52023          	sw	a5,0(a0)
    80001870:	00e05663          	blez	a4,8000187c <_ZN9semaphore6signalEv+0x1c>
            MemoryAllocator::instance().mem_free(removed);
            if(!t->isBlocked()) Scheduler::instanceOfScheduler().put(t);
        }
    }
    return 0;
}
    80001874:	00000513          	li	a0,0
    80001878:	00008067          	ret
int semaphore::signal(){
    8000187c:	fe010113          	addi	sp,sp,-32
    80001880:	00113c23          	sd	ra,24(sp)
    80001884:	00813823          	sd	s0,16(sp)
    80001888:	00913423          	sd	s1,8(sp)
    8000188c:	01213023          	sd	s2,0(sp)
    80001890:	02010413          	addi	s0,sp,32
        if(head){
    80001894:	00853483          	ld	s1,8(a0)
    80001898:	02048c63          	beqz	s1,800018d0 <_ZN9semaphore6signalEv+0x70>
            TCB* t = removed->thread;
    8000189c:	0004b903          	ld	s2,0(s1)
    800018a0:	020904a3          	sb	zero,41(s2)
            head = head->next;
    800018a4:	00853783          	ld	a5,8(a0)
    800018a8:	0087b783          	ld	a5,8(a5)
    800018ac:	00f53423          	sd	a5,8(a0)
            if(!head) tail = nullptr;
    800018b0:	02078e63          	beqz	a5,800018ec <_ZN9semaphore6signalEv+0x8c>
            MemoryAllocator::instance().mem_free(removed);
    800018b4:	00001097          	auipc	ra,0x1
    800018b8:	358080e7          	jalr	856(ra) # 80002c0c <_ZN15MemoryAllocator8instanceEv>
    800018bc:	00048593          	mv	a1,s1
    800018c0:	00001097          	auipc	ra,0x1
    800018c4:	4d0080e7          	jalr	1232(ra) # 80002d90 <_ZN15MemoryAllocator8mem_freeEPv>
    bool isBlocked() const { return blocked; }
    800018c8:	02994783          	lbu	a5,41(s2)
            if(!t->isBlocked()) Scheduler::instanceOfScheduler().put(t);
    800018cc:	02078463          	beqz	a5,800018f4 <_ZN9semaphore6signalEv+0x94>
}
    800018d0:	00000513          	li	a0,0
    800018d4:	01813083          	ld	ra,24(sp)
    800018d8:	01013403          	ld	s0,16(sp)
    800018dc:	00813483          	ld	s1,8(sp)
    800018e0:	00013903          	ld	s2,0(sp)
    800018e4:	02010113          	addi	sp,sp,32
    800018e8:	00008067          	ret
            if(!head) tail = nullptr;
    800018ec:	00053823          	sd	zero,16(a0)
    800018f0:	fc5ff06f          	j	800018b4 <_ZN9semaphore6signalEv+0x54>
            if(!t->isBlocked()) Scheduler::instanceOfScheduler().put(t);
    800018f4:	00000097          	auipc	ra,0x0
    800018f8:	0e0080e7          	jalr	224(ra) # 800019d4 <_ZN9Scheduler19instanceOfSchedulerEv>
    800018fc:	00090593          	mv	a1,s2
    80001900:	00000097          	auipc	ra,0x0
    80001904:	0f4080e7          	jalr	244(ra) # 800019f4 <_ZN9Scheduler3putEP3TCB>
    80001908:	fc9ff06f          	j	800018d0 <_ZN9semaphore6signalEv+0x70>

000000008000190c <_ZN9semaphore4waitEv>:

int semaphore::wait(){
    8000190c:	fe010113          	addi	sp,sp,-32
    80001910:	00113c23          	sd	ra,24(sp)
    80001914:	00813823          	sd	s0,16(sp)
    80001918:	00913423          	sd	s1,8(sp)
    8000191c:	01213023          	sd	s2,0(sp)
    80001920:	02010413          	addi	s0,sp,32
    TCB* old = TCB::running;
    80001924:	0000a797          	auipc	a5,0xa
    80001928:	e9c7b783          	ld	a5,-356(a5) # 8000b7c0 <_GLOBAL_OFFSET_TABLE_+0x68>
    8000192c:	0007b903          	ld	s2,0(a5)
    if(--status < 0){
    80001930:	00052783          	lw	a5,0(a0)
    80001934:	fff7879b          	addiw	a5,a5,-1
    80001938:	00f52023          	sw	a5,0(a0)
    8000193c:	02079713          	slli	a4,a5,0x20
    80001940:	02074063          	bltz	a4,80001960 <_ZN9semaphore4waitEv+0x54>
        else tail->next = newBlocked;
        tail = newBlocked;
        thread_dispatch();
    }
    return 0;
    80001944:	00000513          	li	a0,0
    80001948:	01813083          	ld	ra,24(sp)
    8000194c:	01013403          	ld	s0,16(sp)
    80001950:	00813483          	ld	s1,8(sp)
    80001954:	00013903          	ld	s2,0(sp)
    80001958:	02010113          	addi	sp,sp,32
    8000195c:	00008067          	ret
    80001960:	00050493          	mv	s1,a0
    void setBlocked(bool value) { blocked = value; }
    80001964:	00100793          	li	a5,1
    80001968:	02f904a3          	sb	a5,41(s2)
        Blocked* newBlocked = (Blocked*) MemoryAllocator::instance().mem_alloc((sizeof(Blocked) + MEM_BLOCK_SIZE - 1)/MEM_BLOCK_SIZE);
    8000196c:	00001097          	auipc	ra,0x1
    80001970:	2a0080e7          	jalr	672(ra) # 80002c0c <_ZN15MemoryAllocator8instanceEv>
    80001974:	00100593          	li	a1,1
    80001978:	00001097          	auipc	ra,0x1
    8000197c:	358080e7          	jalr	856(ra) # 80002cd0 <_ZN15MemoryAllocator9mem_allocEm>
        newBlocked->thread = old;
    80001980:	01253023          	sd	s2,0(a0)
        newBlocked->next = nullptr;
    80001984:	00053423          	sd	zero,8(a0)
        if(!head) head = newBlocked;
    80001988:	0084b783          	ld	a5,8(s1)
    8000198c:	00078e63          	beqz	a5,800019a8 <_ZN9semaphore4waitEv+0x9c>
        else tail->next = newBlocked;
    80001990:	0104b783          	ld	a5,16(s1)
    80001994:	00a7b423          	sd	a0,8(a5)
        tail = newBlocked;
    80001998:	00a4b823          	sd	a0,16(s1)
        thread_dispatch();
    8000199c:	00000097          	auipc	ra,0x0
    800019a0:	b70080e7          	jalr	-1168(ra) # 8000150c <_Z15thread_dispatchv>
    800019a4:	fa1ff06f          	j	80001944 <_ZN9semaphore4waitEv+0x38>
        if(!head) head = newBlocked;
    800019a8:	00a4b423          	sd	a0,8(s1)
    800019ac:	fedff06f          	j	80001998 <_ZN9semaphore4waitEv+0x8c>

00000000800019b0 <_ZN9Scheduler8idleBodyEPv>:
#include "../h/Scheduler.hpp"
#include "../h/syscall_c.h"

TCB* Scheduler::idle = nullptr;
void Scheduler::idleBody(void* arg) {
    800019b0:	ff010113          	addi	sp,sp,-16
    800019b4:	00113423          	sd	ra,8(sp)
    800019b8:	00813023          	sd	s0,0(sp)
    800019bc:	01010413          	addi	s0,sp,16
    //Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    changeToUser();
    800019c0:	00000097          	auipc	ra,0x0
    800019c4:	d90080e7          	jalr	-624(ra) # 80001750 <_Z12changeToUserv>
    while(true){
        thread_dispatch();
    800019c8:	00000097          	auipc	ra,0x0
    800019cc:	b44080e7          	jalr	-1212(ra) # 8000150c <_Z15thread_dispatchv>
    while(true){
    800019d0:	ff9ff06f          	j	800019c8 <_ZN9Scheduler8idleBodyEPv+0x18>

00000000800019d4 <_ZN9Scheduler19instanceOfSchedulerEv>:
    }
}

Scheduler &Scheduler::instanceOfScheduler() {
    800019d4:	ff010113          	addi	sp,sp,-16
    800019d8:	00813423          	sd	s0,8(sp)
    800019dc:	01010413          	addi	s0,sp,16
    static Scheduler singleton;
    return singleton;
}
    800019e0:	0000a517          	auipc	a0,0xa
    800019e4:	e3050513          	addi	a0,a0,-464 # 8000b810 <_ZZN9Scheduler19instanceOfSchedulerEvE9singleton>
    800019e8:	00813403          	ld	s0,8(sp)
    800019ec:	01010113          	addi	sp,sp,16
    800019f0:	00008067          	ret

00000000800019f4 <_ZN9Scheduler3putEP3TCB>:

void Scheduler::put(TCB *tcb) {
    if(!tcb) return;
    800019f4:	06058a63          	beqz	a1,80001a68 <_ZN9Scheduler3putEP3TCB+0x74>
void Scheduler::put(TCB *tcb) {
    800019f8:	fe010113          	addi	sp,sp,-32
    800019fc:	00113c23          	sd	ra,24(sp)
    80001a00:	00813823          	sd	s0,16(sp)
    80001a04:	00913423          	sd	s1,8(sp)
    80001a08:	01213023          	sd	s2,0(sp)
    80001a0c:	02010413          	addi	s0,sp,32
    80001a10:	00050493          	mv	s1,a0
    80001a14:	00058913          	mv	s2,a1
    Elem* newElem = (Elem*) MemoryAllocator::instance().mem_alloc((sizeof(Elem) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    80001a18:	00001097          	auipc	ra,0x1
    80001a1c:	1f4080e7          	jalr	500(ra) # 80002c0c <_ZN15MemoryAllocator8instanceEv>
    80001a20:	00100593          	li	a1,1
    80001a24:	00001097          	auipc	ra,0x1
    80001a28:	2ac080e7          	jalr	684(ra) # 80002cd0 <_ZN15MemoryAllocator9mem_allocEm>
    newElem->thread = tcb;
    80001a2c:	01253023          	sd	s2,0(a0)
    newElem->next = nullptr;
    80001a30:	00053423          	sd	zero,8(a0)
    if(!head) head = newElem;
    80001a34:	0084b783          	ld	a5,8(s1)
    80001a38:	02078463          	beqz	a5,80001a60 <_ZN9Scheduler3putEP3TCB+0x6c>
    else tail->next = newElem;
    80001a3c:	0004b783          	ld	a5,0(s1)
    80001a40:	00a7b423          	sd	a0,8(a5)
    tail = newElem;
    80001a44:	00a4b023          	sd	a0,0(s1)
}
    80001a48:	01813083          	ld	ra,24(sp)
    80001a4c:	01013403          	ld	s0,16(sp)
    80001a50:	00813483          	ld	s1,8(sp)
    80001a54:	00013903          	ld	s2,0(sp)
    80001a58:	02010113          	addi	sp,sp,32
    80001a5c:	00008067          	ret
    if(!head) head = newElem;
    80001a60:	00a4b423          	sd	a0,8(s1)
    80001a64:	fe1ff06f          	j	80001a44 <_ZN9Scheduler3putEP3TCB+0x50>
    80001a68:	00008067          	ret

0000000080001a6c <_ZN9Scheduler3getEv>:

TCB *Scheduler::get() {
    80001a6c:	fe010113          	addi	sp,sp,-32
    80001a70:	00113c23          	sd	ra,24(sp)
    80001a74:	00813823          	sd	s0,16(sp)
    80001a78:	00913423          	sd	s1,8(sp)
    80001a7c:	01213023          	sd	s2,0(sp)
    80001a80:	02010413          	addi	s0,sp,32
    if(!head) return idle;
    80001a84:	00853483          	ld	s1,8(a0)
    80001a88:	04048263          	beqz	s1,80001acc <_ZN9Scheduler3getEv+0x60>
    Elem* removed = head;
    head = head->next;
    80001a8c:	0084b783          	ld	a5,8(s1)
    80001a90:	00f53423          	sd	a5,8(a0)
    if(!head) tail = nullptr;
    80001a94:	04078263          	beqz	a5,80001ad8 <_ZN9Scheduler3getEv+0x6c>

    TCB* thread = removed->thread;
    80001a98:	0004b903          	ld	s2,0(s1)
    MemoryAllocator::instance().mem_free(removed);
    80001a9c:	00001097          	auipc	ra,0x1
    80001aa0:	170080e7          	jalr	368(ra) # 80002c0c <_ZN15MemoryAllocator8instanceEv>
    80001aa4:	00048593          	mv	a1,s1
    80001aa8:	00001097          	auipc	ra,0x1
    80001aac:	2e8080e7          	jalr	744(ra) # 80002d90 <_ZN15MemoryAllocator8mem_freeEPv>
    return thread;
}
    80001ab0:	00090513          	mv	a0,s2
    80001ab4:	01813083          	ld	ra,24(sp)
    80001ab8:	01013403          	ld	s0,16(sp)
    80001abc:	00813483          	ld	s1,8(sp)
    80001ac0:	00013903          	ld	s2,0(sp)
    80001ac4:	02010113          	addi	sp,sp,32
    80001ac8:	00008067          	ret
    if(!head) return idle;
    80001acc:	0000a917          	auipc	s2,0xa
    80001ad0:	d5493903          	ld	s2,-684(s2) # 8000b820 <_ZN9Scheduler4idleE>
    80001ad4:	fddff06f          	j	80001ab0 <_ZN9Scheduler3getEv+0x44>
    if(!head) tail = nullptr;
    80001ad8:	00053023          	sd	zero,0(a0)
    80001adc:	fbdff06f          	j	80001a98 <_ZN9Scheduler3getEv+0x2c>

0000000080001ae0 <main>:
    }
};*/

void consolePutc(void*);
void userMain();
int main(){
    80001ae0:	fd010113          	addi	sp,sp,-48
    80001ae4:	02113423          	sd	ra,40(sp)
    80001ae8:	02813023          	sd	s0,32(sp)
    80001aec:	00913c23          	sd	s1,24(sp)
    80001af0:	03010413          	addi	s0,sp,48
    //omoguci prekide u vektorskom rezimu
    Riscv::w_stvec((uint64) &Riscv::supervisorTrap | 1);
    80001af4:	0000a797          	auipc	a5,0xa
    80001af8:	c8c7b783          	ld	a5,-884(a5) # 8000b780 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001afc:	0017e793          	ori	a5,a5,1
    return stvec;
}

inline void Riscv::w_stvec(uint64 stvec)
{
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001b00:	10579073          	csrw	stvec,a5
    __asm__ volatile ("mv %[a4], a4" : [a4] "=r"(a4));
    return a4;
}

inline void Riscv::ms_sie(uint64 mask) {
    __asm__ volatile ("csrs sie, %[mask]" : : [mask]"r"(mask));
    80001b04:	20000793          	li	a5,512
    80001b08:	1047a073          	csrs	sie,a5
    //omoguci spoljasnje hardverske prekide
    Riscv::ms_sie(Riscv::SIE_SEIE);

    //main nit
    TCB* t;
    thread_create(&t, nullptr, nullptr);
    80001b0c:	00000613          	li	a2,0
    80001b10:	00000593          	li	a1,0
    80001b14:	fd840513          	addi	a0,s0,-40
    80001b18:	00000097          	auipc	ra,0x0
    80001b1c:	910080e7          	jalr	-1776(ra) # 80001428 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::running = t;
    80001b20:	0000a797          	auipc	a5,0xa
    80001b24:	ca07b783          	ld	a5,-864(a5) # 8000b7c0 <_GLOBAL_OFFSET_TABLE_+0x68>
    80001b28:	fd843703          	ld	a4,-40(s0)
    80001b2c:	00e7b023          	sd	a4,0(a5)

    //idle nit
    Scheduler::idle = TCB::createThread(Scheduler::idleBody, nullptr,(char*) MemoryAllocator::instance().mem_alloc(
    80001b30:	00001097          	auipc	ra,0x1
    80001b34:	0dc080e7          	jalr	220(ra) # 80002c0c <_ZN15MemoryAllocator8instanceEv>
    80001b38:	20000593          	li	a1,512
    80001b3c:	00001097          	auipc	ra,0x1
    80001b40:	194080e7          	jalr	404(ra) # 80002cd0 <_ZN15MemoryAllocator9mem_allocEm>
    80001b44:	00050613          	mv	a2,a0
    80001b48:	00000593          	li	a1,0
    80001b4c:	0000a517          	auipc	a0,0xa
    80001b50:	c5453503          	ld	a0,-940(a0) # 8000b7a0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001b54:	00000097          	auipc	ra,0x0
    80001b58:	35c080e7          	jalr	860(ra) # 80001eb0 <_ZN3TCB12createThreadEPFvPvES0_Pc>
    80001b5c:	0000a497          	auipc	s1,0xa
    80001b60:	c5c4b483          	ld	s1,-932(s1) # 8000b7b8 <_GLOBAL_OFFSET_TABLE_+0x60>
    80001b64:	00a4b023          	sd	a0,0(s1)
                                                (8*DEFAULT_STACK_SIZE + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE));
    Scheduler::instanceOfScheduler().put(Scheduler::idle);
    80001b68:	00000097          	auipc	ra,0x0
    80001b6c:	e6c080e7          	jalr	-404(ra) # 800019d4 <_ZN9Scheduler19instanceOfSchedulerEv>
    80001b70:	0004b583          	ld	a1,0(s1)
    80001b74:	00000097          	auipc	ra,0x0
    80001b78:	e80080e7          	jalr	-384(ra) # 800019f4 <_ZN9Scheduler3putEP3TCB>

    //console
    TCB* c = TCB::createThread(consolePutc, nullptr, (char*) MemoryAllocator::instance().mem_alloc(
    80001b7c:	00001097          	auipc	ra,0x1
    80001b80:	090080e7          	jalr	144(ra) # 80002c0c <_ZN15MemoryAllocator8instanceEv>
    80001b84:	20000593          	li	a1,512
    80001b88:	00001097          	auipc	ra,0x1
    80001b8c:	148080e7          	jalr	328(ra) # 80002cd0 <_ZN15MemoryAllocator9mem_allocEm>
    80001b90:	00050613          	mv	a2,a0
    80001b94:	00000593          	li	a1,0
    80001b98:	0000a517          	auipc	a0,0xa
    80001b9c:	c1853503          	ld	a0,-1000(a0) # 8000b7b0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001ba0:	00000097          	auipc	ra,0x0
    80001ba4:	310080e7          	jalr	784(ra) # 80001eb0 <_ZN3TCB12createThreadEPFvPvES0_Pc>
    80001ba8:	00050493          	mv	s1,a0
            (8*DEFAULT_STACK_SIZE + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE));
    Scheduler::instanceOfScheduler().put(c);
    80001bac:	00000097          	auipc	ra,0x0
    80001bb0:	e28080e7          	jalr	-472(ra) # 800019d4 <_ZN9Scheduler19instanceOfSchedulerEv>
    80001bb4:	00048593          	mv	a1,s1
    80001bb8:	00000097          	auipc	ra,0x0
    80001bbc:	e3c080e7          	jalr	-452(ra) # 800019f4 <_ZN9Scheduler3putEP3TCB>
    console::init();
    80001bc0:	00000097          	auipc	ra,0x0
    80001bc4:	068080e7          	jalr	104(ra) # 80001c28 <_ZN7console4initEv>
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80001bc8:	00200793          	li	a5,2
    80001bcc:	1007a073          	csrs	sstatus,a5

    //omoguci prekid od tajmera
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    changeToUser();
    80001bd0:	00000097          	auipc	ra,0x0
    80001bd4:	b80080e7          	jalr	-1152(ra) # 80001750 <_Z12changeToUserv>

    TCB* mainThread ;
    thread_create(&mainThread, reinterpret_cast<void (*)(void *)>(userMain), nullptr);
    80001bd8:	00000613          	li	a2,0
    80001bdc:	0000a597          	auipc	a1,0xa
    80001be0:	b845b583          	ld	a1,-1148(a1) # 8000b760 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001be4:	fd040513          	addi	a0,s0,-48
    80001be8:	00000097          	auipc	ra,0x0
    80001bec:	840080e7          	jalr	-1984(ra) # 80001428 <_Z13thread_createPP3TCBPFvPvES2_>
    while(!mainThread->isFinished()){
    80001bf0:	fd043783          	ld	a5,-48(s0)
    bool isFinished() const { return finished; }
    80001bf4:	0287c783          	lbu	a5,40(a5)
    80001bf8:	00079863          	bnez	a5,80001c08 <main+0x128>
        thread_dispatch();
    80001bfc:	00000097          	auipc	ra,0x0
    80001c00:	910080e7          	jalr	-1776(ra) # 8000150c <_Z15thread_dispatchv>
    80001c04:	fedff06f          	j	80001bf0 <main+0x110>
    }
    thread_dispatch();
    80001c08:	00000097          	auipc	ra,0x0
    80001c0c:	904080e7          	jalr	-1788(ra) # 8000150c <_Z15thread_dispatchv>

    return 0;
    80001c10:	00000513          	li	a0,0
    80001c14:	02813083          	ld	ra,40(sp)
    80001c18:	02013403          	ld	s0,32(sp)
    80001c1c:	01813483          	ld	s1,24(sp)
    80001c20:	03010113          	addi	sp,sp,48
    80001c24:	00008067          	ret

0000000080001c28 <_ZN7console4initEv>:
#include "../h/console.hpp"

buffer* console::bufferOut = nullptr;
buffer* console::bufferIn = nullptr;

void console::init() {
    80001c28:	fe010113          	addi	sp,sp,-32
    80001c2c:	00113c23          	sd	ra,24(sp)
    80001c30:	00813823          	sd	s0,16(sp)
    80001c34:	00913423          	sd	s1,8(sp)
    80001c38:	01213023          	sd	s2,0(sp)
    80001c3c:	02010413          	addi	s0,sp,32
    bufferIn = new buffer(256);
    80001c40:	03800513          	li	a0,56
    80001c44:	00000097          	auipc	ra,0x0
    80001c48:	648080e7          	jalr	1608(ra) # 8000228c <_Znwm>
    80001c4c:	00050493          	mv	s1,a0
    80001c50:	10000593          	li	a1,256
    80001c54:	00001097          	auipc	ra,0x1
    80001c58:	23c080e7          	jalr	572(ra) # 80002e90 <_ZN6bufferC1Ei>
    80001c5c:	0000a797          	auipc	a5,0xa
    80001c60:	bc97b623          	sd	s1,-1076(a5) # 8000b828 <_ZN7console8bufferInE>
    bufferOut = new buffer(256);
    80001c64:	03800513          	li	a0,56
    80001c68:	00000097          	auipc	ra,0x0
    80001c6c:	624080e7          	jalr	1572(ra) # 8000228c <_Znwm>
    80001c70:	00050493          	mv	s1,a0
    80001c74:	10000593          	li	a1,256
    80001c78:	00001097          	auipc	ra,0x1
    80001c7c:	218080e7          	jalr	536(ra) # 80002e90 <_ZN6bufferC1Ei>
    80001c80:	0000a797          	auipc	a5,0xa
    80001c84:	ba97b823          	sd	s1,-1104(a5) # 8000b830 <_ZN7console9bufferOutE>
}
    80001c88:	01813083          	ld	ra,24(sp)
    80001c8c:	01013403          	ld	s0,16(sp)
    80001c90:	00813483          	ld	s1,8(sp)
    80001c94:	00013903          	ld	s2,0(sp)
    80001c98:	02010113          	addi	sp,sp,32
    80001c9c:	00008067          	ret
    80001ca0:	00050913          	mv	s2,a0
    bufferIn = new buffer(256);
    80001ca4:	00048513          	mv	a0,s1
    80001ca8:	00000097          	auipc	ra,0x0
    80001cac:	60c080e7          	jalr	1548(ra) # 800022b4 <_ZdlPv>
    80001cb0:	00090513          	mv	a0,s2
    80001cb4:	0000b097          	auipc	ra,0xb
    80001cb8:	cc4080e7          	jalr	-828(ra) # 8000c978 <_Unwind_Resume>
    80001cbc:	00050913          	mv	s2,a0
    bufferOut = new buffer(256);
    80001cc0:	00048513          	mv	a0,s1
    80001cc4:	00000097          	auipc	ra,0x0
    80001cc8:	5f0080e7          	jalr	1520(ra) # 800022b4 <_ZdlPv>
    80001ccc:	00090513          	mv	a0,s2
    80001cd0:	0000b097          	auipc	ra,0xb
    80001cd4:	ca8080e7          	jalr	-856(ra) # 8000c978 <_Unwind_Resume>

0000000080001cd8 <_ZN7console16putInInputBufferEc>:

void console::putInInputBuffer(char c) {
    80001cd8:	ff010113          	addi	sp,sp,-16
    80001cdc:	00113423          	sd	ra,8(sp)
    80001ce0:	00813023          	sd	s0,0(sp)
    80001ce4:	01010413          	addi	s0,sp,16
    80001ce8:	00050593          	mv	a1,a0
    bufferIn->put(c);
    80001cec:	0000a517          	auipc	a0,0xa
    80001cf0:	b3c53503          	ld	a0,-1220(a0) # 8000b828 <_ZN7console8bufferInE>
    80001cf4:	00001097          	auipc	ra,0x1
    80001cf8:	230080e7          	jalr	560(ra) # 80002f24 <_ZN6buffer3putEc>
}
    80001cfc:	00813083          	ld	ra,8(sp)
    80001d00:	00013403          	ld	s0,0(sp)
    80001d04:	01010113          	addi	sp,sp,16
    80001d08:	00008067          	ret

0000000080001d0c <_ZN7console18getFromInputBufferEv>:

char console::getFromInputBuffer() {
    80001d0c:	ff010113          	addi	sp,sp,-16
    80001d10:	00113423          	sd	ra,8(sp)
    80001d14:	00813023          	sd	s0,0(sp)
    80001d18:	01010413          	addi	s0,sp,16
    return bufferIn->get();
    80001d1c:	0000a517          	auipc	a0,0xa
    80001d20:	b0c53503          	ld	a0,-1268(a0) # 8000b828 <_ZN7console8bufferInE>
    80001d24:	00001097          	auipc	ra,0x1
    80001d28:	28c080e7          	jalr	652(ra) # 80002fb0 <_ZN6buffer3getEv>
}
    80001d2c:	0ff57513          	andi	a0,a0,255
    80001d30:	00813083          	ld	ra,8(sp)
    80001d34:	00013403          	ld	s0,0(sp)
    80001d38:	01010113          	addi	sp,sp,16
    80001d3c:	00008067          	ret

0000000080001d40 <_ZN7console17putInOutputBufferEc>:

void console::putInOutputBuffer(char c) {
    80001d40:	ff010113          	addi	sp,sp,-16
    80001d44:	00113423          	sd	ra,8(sp)
    80001d48:	00813023          	sd	s0,0(sp)
    80001d4c:	01010413          	addi	s0,sp,16
    80001d50:	00050593          	mv	a1,a0
    bufferOut->put(c);
    80001d54:	0000a517          	auipc	a0,0xa
    80001d58:	adc53503          	ld	a0,-1316(a0) # 8000b830 <_ZN7console9bufferOutE>
    80001d5c:	00001097          	auipc	ra,0x1
    80001d60:	1c8080e7          	jalr	456(ra) # 80002f24 <_ZN6buffer3putEc>
}
    80001d64:	00813083          	ld	ra,8(sp)
    80001d68:	00013403          	ld	s0,0(sp)
    80001d6c:	01010113          	addi	sp,sp,16
    80001d70:	00008067          	ret

0000000080001d74 <_ZN7console19getFromOutputBufferEv>:

char console::getFromOutputBuffer() {
    80001d74:	ff010113          	addi	sp,sp,-16
    80001d78:	00113423          	sd	ra,8(sp)
    80001d7c:	00813023          	sd	s0,0(sp)
    80001d80:	01010413          	addi	s0,sp,16
    return bufferOut->get();
    80001d84:	0000a517          	auipc	a0,0xa
    80001d88:	aac53503          	ld	a0,-1364(a0) # 8000b830 <_ZN7console9bufferOutE>
    80001d8c:	00001097          	auipc	ra,0x1
    80001d90:	224080e7          	jalr	548(ra) # 80002fb0 <_ZN6buffer3getEv>
}
    80001d94:	0ff57513          	andi	a0,a0,255
    80001d98:	00813083          	ld	ra,8(sp)
    80001d9c:	00013403          	ld	s0,0(sp)
    80001da0:	01010113          	addi	sp,sp,16
    80001da4:	00008067          	ret

0000000080001da8 <_Z11consolePutcPv>:

void consolePutc(void*){
    80001da8:	fe010113          	addi	sp,sp,-32
    80001dac:	00113c23          	sd	ra,24(sp)
    80001db0:	00813823          	sd	s0,16(sp)
    80001db4:	00913423          	sd	s1,8(sp)
    80001db8:	01213023          	sd	s2,0(sp)
    80001dbc:	02010413          	addi	s0,sp,32
    80001dc0:	00c0006f          	j	80001dcc <_Z11consolePutcPv+0x24>
        char ready = *(char*) CONSOLE_STATUS;
        while(ready & CONSOLE_TX_STATUS_BIT){
            *(char*) CONSOLE_TX_DATA = console::getFromOutputBuffer();
            ready = *(char*) CONSOLE_STATUS;
        }
        thread_dispatch();
    80001dc4:	fffff097          	auipc	ra,0xfffff
    80001dc8:	748080e7          	jalr	1864(ra) # 8000150c <_Z15thread_dispatchv>
        char ready = *(char*) CONSOLE_STATUS;
    80001dcc:	0000a797          	auipc	a5,0xa
    80001dd0:	9a47b783          	ld	a5,-1628(a5) # 8000b770 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001dd4:	0007b483          	ld	s1,0(a5)
    80001dd8:	0004c783          	lbu	a5,0(s1)
        while(ready & CONSOLE_TX_STATUS_BIT){
    80001ddc:	0207f793          	andi	a5,a5,32
    80001de0:	fe0782e3          	beqz	a5,80001dc4 <_Z11consolePutcPv+0x1c>
            *(char*) CONSOLE_TX_DATA = console::getFromOutputBuffer();
    80001de4:	0000a797          	auipc	a5,0xa
    80001de8:	9ac7b783          	ld	a5,-1620(a5) # 8000b790 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001dec:	0007b903          	ld	s2,0(a5)
    80001df0:	00000097          	auipc	ra,0x0
    80001df4:	f84080e7          	jalr	-124(ra) # 80001d74 <_ZN7console19getFromOutputBufferEv>
    80001df8:	00a90023          	sb	a0,0(s2)
            ready = *(char*) CONSOLE_STATUS;
    80001dfc:	0004c783          	lbu	a5,0(s1)
        while(ready & CONSOLE_TX_STATUS_BIT){
    80001e00:	fddff06f          	j	80001ddc <_Z11consolePutcPv+0x34>

0000000080001e04 <_ZN3TCB13threadWrapperEv>:
    newTCB->contex.ra = (uint64) &threadWrapper;
    newTCB->contex.sp = newTCB->userStack;
    return newTCB;
}

void TCB::threadWrapper() {
    80001e04:	fe010113          	addi	sp,sp,-32
    80001e08:	00113c23          	sd	ra,24(sp)
    80001e0c:	00813823          	sd	s0,16(sp)
    80001e10:	00913423          	sd	s1,8(sp)
    80001e14:	01213023          	sd	s2,0(sp)
    80001e18:	02010413          	addi	s0,sp,32
    Riscv::popSppSpie();
    80001e1c:	00001097          	auipc	ra,0x1
    80001e20:	8c0080e7          	jalr	-1856(ra) # 800026dc <_ZN5Riscv10popSppSpieEv>
    running->body(running->arg);
    80001e24:	0000a497          	auipc	s1,0xa
    80001e28:	a1448493          	addi	s1,s1,-1516 # 8000b838 <_ZN3TCB7runningE>
    80001e2c:	0004b783          	ld	a5,0(s1)
    80001e30:	0007b703          	ld	a4,0(a5)
    80001e34:	0107b503          	ld	a0,16(a5)
    80001e38:	000700e7          	jalr	a4
    running->setFinished(true);
    80001e3c:	0004b783          	ld	a5,0(s1)
    static void yield();
    static void dispatch();
    static void sleep(time_t timeToSleep);

    bool isFinished() const { return finished; }
    void setFinished(bool value) { finished = value; }
    80001e40:	00100713          	li	a4,1
    80001e44:	02e78423          	sb	a4,40(a5)
    while(running->headSuspend){
    80001e48:	0000a797          	auipc	a5,0xa
    80001e4c:	9f07b783          	ld	a5,-1552(a5) # 8000b838 <_ZN3TCB7runningE>
    80001e50:	0307b483          	ld	s1,48(a5)
    80001e54:	02048e63          	beqz	s1,80001e90 <_ZN3TCB13threadWrapperEv+0x8c>
        Suspend* old = running->headSuspend;
        running->headSuspend = running->headSuspend->next;
    80001e58:	0084b703          	ld	a4,8(s1)
    80001e5c:	02e7b823          	sd	a4,48(a5)
        TCB* t = old->tcb;
    80001e60:	0004b903          	ld	s2,0(s1)
    bool isBlocked() const { return blocked; }
    void setBlocked(bool value) { blocked = value; }
    80001e64:	020904a3          	sb	zero,41(s2)
        t->setBlocked(false);
        Scheduler::instanceOfScheduler().put(t);
    80001e68:	00000097          	auipc	ra,0x0
    80001e6c:	b6c080e7          	jalr	-1172(ra) # 800019d4 <_ZN9Scheduler19instanceOfSchedulerEv>
    80001e70:	00090593          	mv	a1,s2
    80001e74:	00000097          	auipc	ra,0x0
    80001e78:	b80080e7          	jalr	-1152(ra) # 800019f4 <_ZN9Scheduler3putEP3TCB>
        delete(old);
    80001e7c:	fc0486e3          	beqz	s1,80001e48 <_ZN3TCB13threadWrapperEv+0x44>
    80001e80:	00048513          	mv	a0,s1
    80001e84:	00000097          	auipc	ra,0x0
    80001e88:	430080e7          	jalr	1072(ra) # 800022b4 <_ZdlPv>
    80001e8c:	fbdff06f          	j	80001e48 <_ZN3TCB13threadWrapperEv+0x44>
    }
    thread_dispatch();
    80001e90:	fffff097          	auipc	ra,0xfffff
    80001e94:	67c080e7          	jalr	1660(ra) # 8000150c <_Z15thread_dispatchv>
}
    80001e98:	01813083          	ld	ra,24(sp)
    80001e9c:	01013403          	ld	s0,16(sp)
    80001ea0:	00813483          	ld	s1,8(sp)
    80001ea4:	00013903          	ld	s2,0(sp)
    80001ea8:	02010113          	addi	sp,sp,32
    80001eac:	00008067          	ret

0000000080001eb0 <_ZN3TCB12createThreadEPFvPvES0_Pc>:
TCB *TCB::createThread(Body body, void *arg, char* stack_space) {
    80001eb0:	fd010113          	addi	sp,sp,-48
    80001eb4:	02113423          	sd	ra,40(sp)
    80001eb8:	02813023          	sd	s0,32(sp)
    80001ebc:	00913c23          	sd	s1,24(sp)
    80001ec0:	01213823          	sd	s2,16(sp)
    80001ec4:	01313423          	sd	s3,8(sp)
    80001ec8:	03010413          	addi	s0,sp,48
    80001ecc:	00050913          	mv	s2,a0
    80001ed0:	00058993          	mv	s3,a1
    80001ed4:	00060493          	mv	s1,a2
    TCB* newTCB = (TCB*) MemoryAllocator::instance().mem_alloc((sizeof(TCB) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    80001ed8:	00001097          	auipc	ra,0x1
    80001edc:	d34080e7          	jalr	-716(ra) # 80002c0c <_ZN15MemoryAllocator8instanceEv>
    80001ee0:	00100593          	li	a1,1
    80001ee4:	00001097          	auipc	ra,0x1
    80001ee8:	dec080e7          	jalr	-532(ra) # 80002cd0 <_ZN15MemoryAllocator9mem_allocEm>
    newTCB->arg =arg;
    80001eec:	01353823          	sd	s3,16(a0)
    newTCB->body = body;
    80001ef0:	01253023          	sd	s2,0(a0)
    newTCB->finished = false;
    80001ef4:	02050423          	sb	zero,40(a0)
    newTCB->blocked = false;
    80001ef8:	020504a3          	sb	zero,41(a0)
    newTCB->headSuspend = nullptr;
    80001efc:	02053823          	sd	zero,48(a0)
    newTCB->timeSlice = DEFAULT_TIME_SLICE;
    80001f00:	00200793          	li	a5,2
    80001f04:	02f53c23          	sd	a5,56(a0)
    newTCB->userStack = (body != nullptr ? (uint64)&(stack_space[8*DEFAULT_STACK_SIZE]) : 0);
    80001f08:	02090e63          	beqz	s2,80001f44 <_ZN3TCB12createThreadEPFvPvES0_Pc+0x94>
    80001f0c:	00008637          	lui	a2,0x8
    80001f10:	00c48633          	add	a2,s1,a2
    80001f14:	00c53423          	sd	a2,8(a0)
    newTCB->contex.ra = (uint64) &threadWrapper;
    80001f18:	00000797          	auipc	a5,0x0
    80001f1c:	eec78793          	addi	a5,a5,-276 # 80001e04 <_ZN3TCB13threadWrapperEv>
    80001f20:	00f53c23          	sd	a5,24(a0)
    newTCB->contex.sp = newTCB->userStack;
    80001f24:	02c53023          	sd	a2,32(a0)
}
    80001f28:	02813083          	ld	ra,40(sp)
    80001f2c:	02013403          	ld	s0,32(sp)
    80001f30:	01813483          	ld	s1,24(sp)
    80001f34:	01013903          	ld	s2,16(sp)
    80001f38:	00813983          	ld	s3,8(sp)
    80001f3c:	03010113          	addi	sp,sp,48
    80001f40:	00008067          	ret
    newTCB->userStack = (body != nullptr ? (uint64)&(stack_space[8*DEFAULT_STACK_SIZE]) : 0);
    80001f44:	00000613          	li	a2,0
    80001f48:	fcdff06f          	j	80001f14 <_ZN3TCB12createThreadEPFvPvES0_Pc+0x64>

0000000080001f4c <_ZN3TCB8dispatchEv>:

void TCB::dispatch() {
    80001f4c:	fe010113          	addi	sp,sp,-32
    80001f50:	00113c23          	sd	ra,24(sp)
    80001f54:	00813823          	sd	s0,16(sp)
    80001f58:	00913423          	sd	s1,8(sp)
    80001f5c:	02010413          	addi	s0,sp,32
    TCB* old = running;
    80001f60:	0000a497          	auipc	s1,0xa
    80001f64:	8d84b483          	ld	s1,-1832(s1) # 8000b838 <_ZN3TCB7runningE>
    bool isFinished() const { return finished; }
    80001f68:	0284c783          	lbu	a5,40(s1)
    if(!old->isFinished() && !old->isBlocked()) {
    80001f6c:	00079663          	bnez	a5,80001f78 <_ZN3TCB8dispatchEv+0x2c>
    bool isBlocked() const { return blocked; }
    80001f70:	0294c783          	lbu	a5,41(s1)
    80001f74:	04078063          	beqz	a5,80001fb4 <_ZN3TCB8dispatchEv+0x68>
        Scheduler::instanceOfScheduler().put(old);
    }
    running = Scheduler::instanceOfScheduler().get();
    80001f78:	00000097          	auipc	ra,0x0
    80001f7c:	a5c080e7          	jalr	-1444(ra) # 800019d4 <_ZN9Scheduler19instanceOfSchedulerEv>
    80001f80:	00000097          	auipc	ra,0x0
    80001f84:	aec080e7          	jalr	-1300(ra) # 80001a6c <_ZN9Scheduler3getEv>
    80001f88:	0000a797          	auipc	a5,0xa
    80001f8c:	8aa7b823          	sd	a0,-1872(a5) # 8000b838 <_ZN3TCB7runningE>

    TCB::contextSwitch(&old->contex, &running->contex);
    80001f90:	01850593          	addi	a1,a0,24
    80001f94:	01848513          	addi	a0,s1,24
    80001f98:	fffff097          	auipc	ra,0xfffff
    80001f9c:	3c0080e7          	jalr	960(ra) # 80001358 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80001fa0:	01813083          	ld	ra,24(sp)
    80001fa4:	01013403          	ld	s0,16(sp)
    80001fa8:	00813483          	ld	s1,8(sp)
    80001fac:	02010113          	addi	sp,sp,32
    80001fb0:	00008067          	ret
        Scheduler::instanceOfScheduler().put(old);
    80001fb4:	00000097          	auipc	ra,0x0
    80001fb8:	a20080e7          	jalr	-1504(ra) # 800019d4 <_ZN9Scheduler19instanceOfSchedulerEv>
    80001fbc:	00048593          	mv	a1,s1
    80001fc0:	00000097          	auipc	ra,0x0
    80001fc4:	a34080e7          	jalr	-1484(ra) # 800019f4 <_ZN9Scheduler3putEP3TCB>
    80001fc8:	fb1ff06f          	j	80001f78 <_ZN3TCB8dispatchEv+0x2c>

0000000080001fcc <_ZN3TCB4exitEv>:

int TCB::exit() {
    if(!running->isFinished()){
    80001fcc:	0000a797          	auipc	a5,0xa
    80001fd0:	86c7b783          	ld	a5,-1940(a5) # 8000b838 <_ZN3TCB7runningE>
    bool isFinished() const { return finished; }
    80001fd4:	0287c703          	lbu	a4,40(a5)
    80001fd8:	08071863          	bnez	a4,80002068 <_ZN3TCB4exitEv+0x9c>
int TCB::exit() {
    80001fdc:	fe010113          	addi	sp,sp,-32
    80001fe0:	00113c23          	sd	ra,24(sp)
    80001fe4:	00813823          	sd	s0,16(sp)
    80001fe8:	00913423          	sd	s1,8(sp)
    80001fec:	01213023          	sd	s2,0(sp)
    80001ff0:	02010413          	addi	s0,sp,32
    void setFinished(bool value) { finished = value; }
    80001ff4:	00100713          	li	a4,1
    80001ff8:	02e78423          	sb	a4,40(a5)
        running->setFinished(true);
        while(running->headSuspend){
    80001ffc:	0000a797          	auipc	a5,0xa
    80002000:	83c7b783          	ld	a5,-1988(a5) # 8000b838 <_ZN3TCB7runningE>
    80002004:	0307b483          	ld	s1,48(a5)
    80002008:	02048e63          	beqz	s1,80002044 <_ZN3TCB4exitEv+0x78>
            Suspend* old = running->headSuspend;
            running->headSuspend = running->headSuspend->next;
    8000200c:	0084b703          	ld	a4,8(s1)
    80002010:	02e7b823          	sd	a4,48(a5)
            TCB* t = old->tcb;
    80002014:	0004b903          	ld	s2,0(s1)
    void setBlocked(bool value) { blocked = value; }
    80002018:	020904a3          	sb	zero,41(s2)
            t->setBlocked(false);
            Scheduler::instanceOfScheduler().put(t);
    8000201c:	00000097          	auipc	ra,0x0
    80002020:	9b8080e7          	jalr	-1608(ra) # 800019d4 <_ZN9Scheduler19instanceOfSchedulerEv>
    80002024:	00090593          	mv	a1,s2
    80002028:	00000097          	auipc	ra,0x0
    8000202c:	9cc080e7          	jalr	-1588(ra) # 800019f4 <_ZN9Scheduler3putEP3TCB>
            delete(old);
    80002030:	fc0486e3          	beqz	s1,80001ffc <_ZN3TCB4exitEv+0x30>
    80002034:	00048513          	mv	a0,s1
    80002038:	00000097          	auipc	ra,0x0
    8000203c:	27c080e7          	jalr	636(ra) # 800022b4 <_ZdlPv>
    80002040:	fbdff06f          	j	80001ffc <_ZN3TCB4exitEv+0x30>
        }
        thread_dispatch();
    80002044:	fffff097          	auipc	ra,0xfffff
    80002048:	4c8080e7          	jalr	1224(ra) # 8000150c <_Z15thread_dispatchv>
        return 0;
    8000204c:	00000513          	li	a0,0
    }
    return -1;
}
    80002050:	01813083          	ld	ra,24(sp)
    80002054:	01013403          	ld	s0,16(sp)
    80002058:	00813483          	ld	s1,8(sp)
    8000205c:	00013903          	ld	s2,0(sp)
    80002060:	02010113          	addi	sp,sp,32
    80002064:	00008067          	ret
    return -1;
    80002068:	fff00513          	li	a0,-1
}
    8000206c:	00008067          	ret

0000000080002070 <_ZN3TCB4joinEPS_>:
    bool isFinished() const { return finished; }
    80002070:	0285c783          	lbu	a5,40(a1)

void TCB::join(TCB *handle) {
    if(handle->isFinished()) return;
    80002074:	00078463          	beqz	a5,8000207c <_ZN3TCB4joinEPS_+0xc>
    80002078:	00008067          	ret
void TCB::join(TCB *handle) {
    8000207c:	fe010113          	addi	sp,sp,-32
    80002080:	00113c23          	sd	ra,24(sp)
    80002084:	00813823          	sd	s0,16(sp)
    80002088:	00913423          	sd	s1,8(sp)
    8000208c:	01213023          	sd	s2,0(sp)
    80002090:	02010413          	addi	s0,sp,32
    80002094:	00050913          	mv	s2,a0
    80002098:	00058493          	mv	s1,a1
    void setBlocked(bool value) { blocked = value; }
    8000209c:	00100793          	li	a5,1
    800020a0:	02f504a3          	sb	a5,41(a0)
    setBlocked(true);
    Suspend* newSuspend = new Suspend(this, nullptr);
    800020a4:	01000513          	li	a0,16
    800020a8:	00000097          	auipc	ra,0x0
    800020ac:	1e4080e7          	jalr	484(ra) # 8000228c <_Znwm>
    Suspend(TCB* tcb, Suspend* next): tcb(tcb), next(next){};
    800020b0:	01253023          	sd	s2,0(a0)
    800020b4:	00053423          	sd	zero,8(a0)
    if(handle->headSuspend) newSuspend->next = handle->headSuspend;
    800020b8:	0304b783          	ld	a5,48(s1)
    800020bc:	00078463          	beqz	a5,800020c4 <_ZN3TCB4joinEPS_+0x54>
    800020c0:	00f53423          	sd	a5,8(a0)
    handle->headSuspend = newSuspend;
    800020c4:	02a4b823          	sd	a0,48(s1)
    thread_dispatch();
    800020c8:	fffff097          	auipc	ra,0xfffff
    800020cc:	444080e7          	jalr	1092(ra) # 8000150c <_Z15thread_dispatchv>
}
    800020d0:	01813083          	ld	ra,24(sp)
    800020d4:	01013403          	ld	s0,16(sp)
    800020d8:	00813483          	ld	s1,8(sp)
    800020dc:	00013903          	ld	s2,0(sp)
    800020e0:	02010113          	addi	sp,sp,32
    800020e4:	00008067          	ret

00000000800020e8 <_ZN3TCB5sleepEm>:

void TCB::sleep(time_t timeSleep){
    if(timeSleep == 0) return;
    800020e8:	00051463          	bnez	a0,800020f0 <_ZN3TCB5sleepEm+0x8>
    800020ec:	00008067          	ret
void TCB::sleep(time_t timeSleep){
    800020f0:	fe010113          	addi	sp,sp,-32
    800020f4:	00113c23          	sd	ra,24(sp)
    800020f8:	00813823          	sd	s0,16(sp)
    800020fc:	00913423          	sd	s1,8(sp)
    80002100:	02010413          	addi	s0,sp,32
    80002104:	00050493          	mv	s1,a0
    Sleep* newSleep = (Sleep*) MemoryAllocator::instance().mem_alloc((sizeof(Sleep) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    80002108:	00001097          	auipc	ra,0x1
    8000210c:	b04080e7          	jalr	-1276(ra) # 80002c0c <_ZN15MemoryAllocator8instanceEv>
    80002110:	00100593          	li	a1,1
    80002114:	00001097          	auipc	ra,0x1
    80002118:	bbc080e7          	jalr	-1092(ra) # 80002cd0 <_ZN15MemoryAllocator9mem_allocEm>
    8000211c:	00050693          	mv	a3,a0
    newSleep->thread = TCB::running;
    80002120:	00009797          	auipc	a5,0x9
    80002124:	71878793          	addi	a5,a5,1816 # 8000b838 <_ZN3TCB7runningE>
    80002128:	0007b803          	ld	a6,0(a5)
    8000212c:	01053023          	sd	a6,0(a0)
    newSleep->next = nullptr;
    80002130:	00053823          	sd	zero,16(a0)
    newSleep->sleepTime = timeSleep;
    80002134:	00953423          	sd	s1,8(a0)


    if(!sleepHead){
    80002138:	0087b783          	ld	a5,8(a5)
    8000213c:	04078263          	beqz	a5,80002180 <_ZN3TCB5sleepEm+0x98>
        sleepHead = newSleep;
    }
    else if(sleepHead->sleepTime >= timeSleep){
    80002140:	0087b503          	ld	a0,8(a5)
    80002144:	04956463          	bltu	a0,s1,8000218c <_ZN3TCB5sleepEm+0xa4>
        //add first
        sleepHead->sleepTime -= newSleep->sleepTime;
    80002148:	40950533          	sub	a0,a0,s1
    8000214c:	00a7b423          	sd	a0,8(a5)
        newSleep->next = sleepHead;
    80002150:	00f6b823          	sd	a5,16(a3)
        sleepHead = newSleep;
    80002154:	00009797          	auipc	a5,0x9
    80002158:	6ed7b623          	sd	a3,1772(a5) # 8000b840 <_ZN3TCB9sleepHeadE>
    void setBlocked(bool value) { blocked = value; }
    8000215c:	00100793          	li	a5,1
    80002160:	02f804a3          	sb	a5,41(a6)
        prev->next = newSleep;
        newSleep->next = cur;
        if (cur) cur->sleepTime -= newSleep->sleepTime;
    }
    TCB::running->setBlocked(true);
    thread_dispatch();
    80002164:	fffff097          	auipc	ra,0xfffff
    80002168:	3a8080e7          	jalr	936(ra) # 8000150c <_Z15thread_dispatchv>
    8000216c:	01813083          	ld	ra,24(sp)
    80002170:	01013403          	ld	s0,16(sp)
    80002174:	00813483          	ld	s1,8(sp)
    80002178:	02010113          	addi	sp,sp,32
    8000217c:	00008067          	ret
        sleepHead = newSleep;
    80002180:	00009797          	auipc	a5,0x9
    80002184:	6ca7b023          	sd	a0,1728(a5) # 8000b840 <_ZN3TCB9sleepHeadE>
    80002188:	fd5ff06f          	j	8000215c <_ZN3TCB5sleepEm+0x74>
        Sleep *prev = nullptr;
    8000218c:	00000593          	li	a1,0
        while (cur) {
    80002190:	02078263          	beqz	a5,800021b4 <_ZN3TCB5sleepEm+0xcc>
            if (cur->sleepTime > newSleep->sleepTime) break;
    80002194:	0087b603          	ld	a2,8(a5)
    80002198:	0086b703          	ld	a4,8(a3)
    8000219c:	00c76c63          	bltu	a4,a2,800021b4 <_ZN3TCB5sleepEm+0xcc>
            newSleep->sleepTime -= (cur->sleepTime);
    800021a0:	40c70733          	sub	a4,a4,a2
    800021a4:	00e6b423          	sd	a4,8(a3)
            prev = cur;
    800021a8:	00078593          	mv	a1,a5
            cur = cur->next;
    800021ac:	0107b783          	ld	a5,16(a5)
        while (cur) {
    800021b0:	fe1ff06f          	j	80002190 <_ZN3TCB5sleepEm+0xa8>
        prev->next = newSleep;
    800021b4:	00d5b823          	sd	a3,16(a1)
        newSleep->next = cur;
    800021b8:	00f6b823          	sd	a5,16(a3)
        if (cur) cur->sleepTime -= newSleep->sleepTime;
    800021bc:	fa0780e3          	beqz	a5,8000215c <_ZN3TCB5sleepEm+0x74>
    800021c0:	0086b683          	ld	a3,8(a3)
    800021c4:	0087b703          	ld	a4,8(a5)
    800021c8:	40d70733          	sub	a4,a4,a3
    800021cc:	00e7b423          	sd	a4,8(a5)
    800021d0:	f8dff06f          	j	8000215c <_ZN3TCB5sleepEm+0x74>

00000000800021d4 <_ZN6Thread7wrapperEPv>:
    thread_dispatch();
}
int Thread::sleep(time_t time) {
    return time_sleep(time);
}
void Thread::wrapper(void * thread) {
    800021d4:	ff010113          	addi	sp,sp,-16
    800021d8:	00113423          	sd	ra,8(sp)
    800021dc:	00813023          	sd	s0,0(sp)
    800021e0:	01010413          	addi	s0,sp,16
    Thread* t = (Thread*) thread;
    t->run();
    800021e4:	00053783          	ld	a5,0(a0)
    800021e8:	0107b783          	ld	a5,16(a5)
    800021ec:	000780e7          	jalr	a5
}
    800021f0:	00813083          	ld	ra,8(sp)
    800021f4:	00013403          	ld	s0,0(sp)
    800021f8:	01010113          	addi	sp,sp,16
    800021fc:	00008067          	ret

0000000080002200 <_ZN14PeriodicThread3runEv>:
    this->period = period;
}
void PeriodicThread::terminate() {
    finished = 1;
}
void PeriodicThread::run() {
    80002200:	fe010113          	addi	sp,sp,-32
    80002204:	00113c23          	sd	ra,24(sp)
    80002208:	00813823          	sd	s0,16(sp)
    8000220c:	00913423          	sd	s1,8(sp)
    80002210:	02010413          	addi	s0,sp,32
    80002214:	00050493          	mv	s1,a0
    while(!finished){
    80002218:	0284a783          	lw	a5,40(s1)
    8000221c:	02079263          	bnez	a5,80002240 <_ZN14PeriodicThread3runEv+0x40>
        time_sleep(this->period);
    80002220:	0204b503          	ld	a0,32(s1)
    80002224:	fffff097          	auipc	ra,0xfffff
    80002228:	34c080e7          	jalr	844(ra) # 80001570 <_Z10time_sleepm>
        this->periodicActivation();
    8000222c:	0004b783          	ld	a5,0(s1)
    80002230:	0187b783          	ld	a5,24(a5)
    80002234:	00048513          	mv	a0,s1
    80002238:	000780e7          	jalr	a5
    while(!finished){
    8000223c:	fddff06f          	j	80002218 <_ZN14PeriodicThread3runEv+0x18>
    }
}
    80002240:	01813083          	ld	ra,24(sp)
    80002244:	01013403          	ld	s0,16(sp)
    80002248:	00813483          	ld	s1,8(sp)
    8000224c:	02010113          	addi	sp,sp,32
    80002250:	00008067          	ret

0000000080002254 <_ZN9SemaphoreD1Ev>:
Semaphore::~Semaphore(){
    80002254:	ff010113          	addi	sp,sp,-16
    80002258:	00113423          	sd	ra,8(sp)
    8000225c:	00813023          	sd	s0,0(sp)
    80002260:	01010413          	addi	s0,sp,16
    80002264:	00009797          	auipc	a5,0x9
    80002268:	30c78793          	addi	a5,a5,780 # 8000b570 <_ZTV9Semaphore+0x10>
    8000226c:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80002270:	00853503          	ld	a0,8(a0)
    80002274:	fffff097          	auipc	ra,0xfffff
    80002278:	38c080e7          	jalr	908(ra) # 80001600 <_Z9sem_closeP9semaphore>
}
    8000227c:	00813083          	ld	ra,8(sp)
    80002280:	00013403          	ld	s0,0(sp)
    80002284:	01010113          	addi	sp,sp,16
    80002288:	00008067          	ret

000000008000228c <_Znwm>:
void *operator new(size_t n){
    8000228c:	ff010113          	addi	sp,sp,-16
    80002290:	00113423          	sd	ra,8(sp)
    80002294:	00813023          	sd	s0,0(sp)
    80002298:	01010413          	addi	s0,sp,16
    return mem_alloc(n);
    8000229c:	fffff097          	auipc	ra,0xfffff
    800022a0:	10c080e7          	jalr	268(ra) # 800013a8 <_Z9mem_allocm>
}
    800022a4:	00813083          	ld	ra,8(sp)
    800022a8:	00013403          	ld	s0,0(sp)
    800022ac:	01010113          	addi	sp,sp,16
    800022b0:	00008067          	ret

00000000800022b4 <_ZdlPv>:
void operator delete(void *p) {
    800022b4:	ff010113          	addi	sp,sp,-16
    800022b8:	00113423          	sd	ra,8(sp)
    800022bc:	00813023          	sd	s0,0(sp)
    800022c0:	01010413          	addi	s0,sp,16
    mem_free(p);
    800022c4:	fffff097          	auipc	ra,0xfffff
    800022c8:	124080e7          	jalr	292(ra) # 800013e8 <_Z8mem_freePv>
}
    800022cc:	00813083          	ld	ra,8(sp)
    800022d0:	00013403          	ld	s0,0(sp)
    800022d4:	01010113          	addi	sp,sp,16
    800022d8:	00008067          	ret

00000000800022dc <_ZN6ThreadD1Ev>:
Thread::~Thread(){
    800022dc:	00009797          	auipc	a5,0x9
    800022e0:	26c78793          	addi	a5,a5,620 # 8000b548 <_ZTV6Thread+0x10>
    800022e4:	00f53023          	sd	a5,0(a0)
    delete myHandle;
    800022e8:	00853503          	ld	a0,8(a0)
    800022ec:	02050663          	beqz	a0,80002318 <_ZN6ThreadD1Ev+0x3c>
Thread::~Thread(){
    800022f0:	ff010113          	addi	sp,sp,-16
    800022f4:	00113423          	sd	ra,8(sp)
    800022f8:	00813023          	sd	s0,0(sp)
    800022fc:	01010413          	addi	s0,sp,16
    delete myHandle;
    80002300:	00000097          	auipc	ra,0x0
    80002304:	fb4080e7          	jalr	-76(ra) # 800022b4 <_ZdlPv>
}
    80002308:	00813083          	ld	ra,8(sp)
    8000230c:	00013403          	ld	s0,0(sp)
    80002310:	01010113          	addi	sp,sp,16
    80002314:	00008067          	ret
    80002318:	00008067          	ret

000000008000231c <_ZN6ThreadD0Ev>:
Thread::~Thread(){
    8000231c:	fe010113          	addi	sp,sp,-32
    80002320:	00113c23          	sd	ra,24(sp)
    80002324:	00813823          	sd	s0,16(sp)
    80002328:	00913423          	sd	s1,8(sp)
    8000232c:	02010413          	addi	s0,sp,32
    80002330:	00050493          	mv	s1,a0
}
    80002334:	00000097          	auipc	ra,0x0
    80002338:	fa8080e7          	jalr	-88(ra) # 800022dc <_ZN6ThreadD1Ev>
    8000233c:	00048513          	mv	a0,s1
    80002340:	00000097          	auipc	ra,0x0
    80002344:	f74080e7          	jalr	-140(ra) # 800022b4 <_ZdlPv>
    80002348:	01813083          	ld	ra,24(sp)
    8000234c:	01013403          	ld	s0,16(sp)
    80002350:	00813483          	ld	s1,8(sp)
    80002354:	02010113          	addi	sp,sp,32
    80002358:	00008067          	ret

000000008000235c <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore(){
    8000235c:	fe010113          	addi	sp,sp,-32
    80002360:	00113c23          	sd	ra,24(sp)
    80002364:	00813823          	sd	s0,16(sp)
    80002368:	00913423          	sd	s1,8(sp)
    8000236c:	02010413          	addi	s0,sp,32
    80002370:	00050493          	mv	s1,a0
}
    80002374:	00000097          	auipc	ra,0x0
    80002378:	ee0080e7          	jalr	-288(ra) # 80002254 <_ZN9SemaphoreD1Ev>
    8000237c:	00048513          	mv	a0,s1
    80002380:	00000097          	auipc	ra,0x0
    80002384:	f34080e7          	jalr	-204(ra) # 800022b4 <_ZdlPv>
    80002388:	01813083          	ld	ra,24(sp)
    8000238c:	01013403          	ld	s0,16(sp)
    80002390:	00813483          	ld	s1,8(sp)
    80002394:	02010113          	addi	sp,sp,32
    80002398:	00008067          	ret

000000008000239c <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    8000239c:	ff010113          	addi	sp,sp,-16
    800023a0:	00113423          	sd	ra,8(sp)
    800023a4:	00813023          	sd	s0,0(sp)
    800023a8:	01010413          	addi	s0,sp,16
    800023ac:	00009797          	auipc	a5,0x9
    800023b0:	19c78793          	addi	a5,a5,412 # 8000b548 <_ZTV6Thread+0x10>
    800023b4:	00f53023          	sd	a5,0(a0)
    thread_create(&myHandle, body, arg);
    800023b8:	00850513          	addi	a0,a0,8
    800023bc:	fffff097          	auipc	ra,0xfffff
    800023c0:	06c080e7          	jalr	108(ra) # 80001428 <_Z13thread_createPP3TCBPFvPvES2_>
}
    800023c4:	00813083          	ld	ra,8(sp)
    800023c8:	00013403          	ld	s0,0(sp)
    800023cc:	01010113          	addi	sp,sp,16
    800023d0:	00008067          	ret

00000000800023d4 <_ZN6Thread5startEv>:
int Thread::start() {
    800023d4:	fe010113          	addi	sp,sp,-32
    800023d8:	00113c23          	sd	ra,24(sp)
    800023dc:	00813823          	sd	s0,16(sp)
    800023e0:	00913423          	sd	s1,8(sp)
    800023e4:	02010413          	addi	s0,sp,32
    800023e8:	00050493          	mv	s1,a0
    Scheduler::instanceOfScheduler().put(myHandle);
    800023ec:	fffff097          	auipc	ra,0xfffff
    800023f0:	5e8080e7          	jalr	1512(ra) # 800019d4 <_ZN9Scheduler19instanceOfSchedulerEv>
    800023f4:	0084b583          	ld	a1,8(s1)
    800023f8:	fffff097          	auipc	ra,0xfffff
    800023fc:	5fc080e7          	jalr	1532(ra) # 800019f4 <_ZN9Scheduler3putEP3TCB>
}
    80002400:	00000513          	li	a0,0
    80002404:	01813083          	ld	ra,24(sp)
    80002408:	01013403          	ld	s0,16(sp)
    8000240c:	00813483          	ld	s1,8(sp)
    80002410:	02010113          	addi	sp,sp,32
    80002414:	00008067          	ret

0000000080002418 <_ZN6Thread4joinEv>:
void Thread::join() {
    80002418:	ff010113          	addi	sp,sp,-16
    8000241c:	00113423          	sd	ra,8(sp)
    80002420:	00813023          	sd	s0,0(sp)
    80002424:	01010413          	addi	s0,sp,16
    thread_join(myHandle);
    80002428:	00853503          	ld	a0,8(a0)
    8000242c:	fffff097          	auipc	ra,0xfffff
    80002430:	10c080e7          	jalr	268(ra) # 80001538 <_Z11thread_joinP3TCB>
}
    80002434:	00813083          	ld	ra,8(sp)
    80002438:	00013403          	ld	s0,0(sp)
    8000243c:	01010113          	addi	sp,sp,16
    80002440:	00008067          	ret

0000000080002444 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002444:	ff010113          	addi	sp,sp,-16
    80002448:	00113423          	sd	ra,8(sp)
    8000244c:	00813023          	sd	s0,0(sp)
    80002450:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80002454:	fffff097          	auipc	ra,0xfffff
    80002458:	0b8080e7          	jalr	184(ra) # 8000150c <_Z15thread_dispatchv>
}
    8000245c:	00813083          	ld	ra,8(sp)
    80002460:	00013403          	ld	s0,0(sp)
    80002464:	01010113          	addi	sp,sp,16
    80002468:	00008067          	ret

000000008000246c <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t time) {
    8000246c:	ff010113          	addi	sp,sp,-16
    80002470:	00113423          	sd	ra,8(sp)
    80002474:	00813023          	sd	s0,0(sp)
    80002478:	01010413          	addi	s0,sp,16
    return time_sleep(time);
    8000247c:	fffff097          	auipc	ra,0xfffff
    80002480:	0f4080e7          	jalr	244(ra) # 80001570 <_Z10time_sleepm>
}
    80002484:	00813083          	ld	ra,8(sp)
    80002488:	00013403          	ld	s0,0(sp)
    8000248c:	01010113          	addi	sp,sp,16
    80002490:	00008067          	ret

0000000080002494 <_ZN6ThreadC1Ev>:
Thread::Thread(){
    80002494:	ff010113          	addi	sp,sp,-16
    80002498:	00113423          	sd	ra,8(sp)
    8000249c:	00813023          	sd	s0,0(sp)
    800024a0:	01010413          	addi	s0,sp,16
    800024a4:	00009797          	auipc	a5,0x9
    800024a8:	0a478793          	addi	a5,a5,164 # 8000b548 <_ZTV6Thread+0x10>
    800024ac:	00f53023          	sd	a5,0(a0)
    thread_create_no(&myHandle, wrapper, this);
    800024b0:	00050613          	mv	a2,a0
    800024b4:	00000597          	auipc	a1,0x0
    800024b8:	d2058593          	addi	a1,a1,-736 # 800021d4 <_ZN6Thread7wrapperEPv>
    800024bc:	00850513          	addi	a0,a0,8
    800024c0:	fffff097          	auipc	ra,0xfffff
    800024c4:	fbc080e7          	jalr	-68(ra) # 8000147c <_Z16thread_create_noPP3TCBPFvPvES2_>
}
    800024c8:	00813083          	ld	ra,8(sp)
    800024cc:	00013403          	ld	s0,0(sp)
    800024d0:	01010113          	addi	sp,sp,16
    800024d4:	00008067          	ret

00000000800024d8 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    800024d8:	ff010113          	addi	sp,sp,-16
    800024dc:	00113423          	sd	ra,8(sp)
    800024e0:	00813023          	sd	s0,0(sp)
    800024e4:	01010413          	addi	s0,sp,16
    800024e8:	00009797          	auipc	a5,0x9
    800024ec:	08878793          	addi	a5,a5,136 # 8000b570 <_ZTV9Semaphore+0x10>
    800024f0:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    800024f4:	00850513          	addi	a0,a0,8
    800024f8:	fffff097          	auipc	ra,0xfffff
    800024fc:	0ac080e7          	jalr	172(ra) # 800015a4 <_Z8sem_openPP9semaphorej>
}
    80002500:	00813083          	ld	ra,8(sp)
    80002504:	00013403          	ld	s0,0(sp)
    80002508:	01010113          	addi	sp,sp,16
    8000250c:	00008067          	ret

0000000080002510 <_ZN9Semaphore4waitEv>:
int Semaphore::wait(){
    80002510:	ff010113          	addi	sp,sp,-16
    80002514:	00113423          	sd	ra,8(sp)
    80002518:	00813023          	sd	s0,0(sp)
    8000251c:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80002520:	00853503          	ld	a0,8(a0)
    80002524:	fffff097          	auipc	ra,0xfffff
    80002528:	128080e7          	jalr	296(ra) # 8000164c <_Z8sem_waitP9semaphore>
}
    8000252c:	00813083          	ld	ra,8(sp)
    80002530:	00013403          	ld	s0,0(sp)
    80002534:	01010113          	addi	sp,sp,16
    80002538:	00008067          	ret

000000008000253c <_ZN9Semaphore6signalEv>:
int Semaphore::signal(){
    8000253c:	ff010113          	addi	sp,sp,-16
    80002540:	00113423          	sd	ra,8(sp)
    80002544:	00813023          	sd	s0,0(sp)
    80002548:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    8000254c:	00853503          	ld	a0,8(a0)
    80002550:	fffff097          	auipc	ra,0xfffff
    80002554:	148080e7          	jalr	328(ra) # 80001698 <_Z10sem_signalP9semaphore>
}
    80002558:	00813083          	ld	ra,8(sp)
    8000255c:	00013403          	ld	s0,0(sp)
    80002560:	01010113          	addi	sp,sp,16
    80002564:	00008067          	ret

0000000080002568 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) {
    80002568:	fe010113          	addi	sp,sp,-32
    8000256c:	00113c23          	sd	ra,24(sp)
    80002570:	00813823          	sd	s0,16(sp)
    80002574:	00913423          	sd	s1,8(sp)
    80002578:	01213023          	sd	s2,0(sp)
    8000257c:	02010413          	addi	s0,sp,32
    80002580:	00050493          	mv	s1,a0
    80002584:	00058913          	mv	s2,a1
    80002588:	00000097          	auipc	ra,0x0
    8000258c:	f0c080e7          	jalr	-244(ra) # 80002494 <_ZN6ThreadC1Ev>
    80002590:	00009797          	auipc	a5,0x9
    80002594:	00078793          	mv	a5,a5
    80002598:	00f4b023          	sd	a5,0(s1)
    8000259c:	0204a423          	sw	zero,40(s1)
    this->period = period;
    800025a0:	0324b023          	sd	s2,32(s1)
}
    800025a4:	01813083          	ld	ra,24(sp)
    800025a8:	01013403          	ld	s0,16(sp)
    800025ac:	00813483          	ld	s1,8(sp)
    800025b0:	00013903          	ld	s2,0(sp)
    800025b4:	02010113          	addi	sp,sp,32
    800025b8:	00008067          	ret

00000000800025bc <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    800025bc:	ff010113          	addi	sp,sp,-16
    800025c0:	00813423          	sd	s0,8(sp)
    800025c4:	01010413          	addi	s0,sp,16
    finished = 1;
    800025c8:	00100793          	li	a5,1
    800025cc:	02f52423          	sw	a5,40(a0)
}
    800025d0:	00813403          	ld	s0,8(sp)
    800025d4:	01010113          	addi	sp,sp,16
    800025d8:	00008067          	ret

00000000800025dc <_ZN7Console4getcEv>:

//Console
char Console::getc() {
    800025dc:	ff010113          	addi	sp,sp,-16
    800025e0:	00113423          	sd	ra,8(sp)
    800025e4:	00813023          	sd	s0,0(sp)
    800025e8:	01010413          	addi	s0,sp,16
    return ::getc();
    800025ec:	fffff097          	auipc	ra,0xfffff
    800025f0:	0f8080e7          	jalr	248(ra) # 800016e4 <_Z4getcv>
}
    800025f4:	00813083          	ld	ra,8(sp)
    800025f8:	00013403          	ld	s0,0(sp)
    800025fc:	01010113          	addi	sp,sp,16
    80002600:	00008067          	ret

0000000080002604 <_ZN7Console4putcEc>:
void Console::putc(char c) {
    80002604:	ff010113          	addi	sp,sp,-16
    80002608:	00113423          	sd	ra,8(sp)
    8000260c:	00813023          	sd	s0,0(sp)
    80002610:	01010413          	addi	s0,sp,16
    ::putc(c);
    80002614:	fffff097          	auipc	ra,0xfffff
    80002618:	10c080e7          	jalr	268(ra) # 80001720 <_Z4putcc>
    8000261c:	00813083          	ld	ra,8(sp)
    80002620:	00013403          	ld	s0,0(sp)
    80002624:	01010113          	addi	sp,sp,16
    80002628:	00008067          	ret

000000008000262c <_ZN6Thread3runEv>:
    void join();
    static void dispatch ();
    static int sleep (time_t);
protected:
    Thread ();
    virtual void run () {}
    8000262c:	ff010113          	addi	sp,sp,-16
    80002630:	00813423          	sd	s0,8(sp)
    80002634:	01010413          	addi	s0,sp,16
    80002638:	00813403          	ld	s0,8(sp)
    8000263c:	01010113          	addi	sp,sp,16
    80002640:	00008067          	ret

0000000080002644 <_ZN14PeriodicThread18periodicActivationEv>:
class PeriodicThread : public Thread {
public:
    void terminate ();
protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
    80002644:	ff010113          	addi	sp,sp,-16
    80002648:	00813423          	sd	s0,8(sp)
    8000264c:	01010413          	addi	s0,sp,16
    80002650:	00813403          	ld	s0,8(sp)
    80002654:	01010113          	addi	sp,sp,16
    80002658:	00008067          	ret

000000008000265c <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    8000265c:	ff010113          	addi	sp,sp,-16
    80002660:	00113423          	sd	ra,8(sp)
    80002664:	00813023          	sd	s0,0(sp)
    80002668:	01010413          	addi	s0,sp,16
    8000266c:	00009797          	auipc	a5,0x9
    80002670:	f2478793          	addi	a5,a5,-220 # 8000b590 <_ZTV14PeriodicThread+0x10>
    80002674:	00f53023          	sd	a5,0(a0)
    80002678:	00000097          	auipc	ra,0x0
    8000267c:	c64080e7          	jalr	-924(ra) # 800022dc <_ZN6ThreadD1Ev>
    80002680:	00813083          	ld	ra,8(sp)
    80002684:	00013403          	ld	s0,0(sp)
    80002688:	01010113          	addi	sp,sp,16
    8000268c:	00008067          	ret

0000000080002690 <_ZN14PeriodicThreadD0Ev>:
    80002690:	fe010113          	addi	sp,sp,-32
    80002694:	00113c23          	sd	ra,24(sp)
    80002698:	00813823          	sd	s0,16(sp)
    8000269c:	00913423          	sd	s1,8(sp)
    800026a0:	02010413          	addi	s0,sp,32
    800026a4:	00050493          	mv	s1,a0
    800026a8:	00009797          	auipc	a5,0x9
    800026ac:	ee878793          	addi	a5,a5,-280 # 8000b590 <_ZTV14PeriodicThread+0x10>
    800026b0:	00f53023          	sd	a5,0(a0)
    800026b4:	00000097          	auipc	ra,0x0
    800026b8:	c28080e7          	jalr	-984(ra) # 800022dc <_ZN6ThreadD1Ev>
    800026bc:	00048513          	mv	a0,s1
    800026c0:	00000097          	auipc	ra,0x0
    800026c4:	bf4080e7          	jalr	-1036(ra) # 800022b4 <_ZdlPv>
    800026c8:	01813083          	ld	ra,24(sp)
    800026cc:	01013403          	ld	s0,16(sp)
    800026d0:	00813483          	ld	s1,8(sp)
    800026d4:	02010113          	addi	sp,sp,32
    800026d8:	00008067          	ret

00000000800026dc <_ZN5Riscv10popSppSpieEv>:
#include "../h/Scheduler.hpp"
#include "../h/tcb.hpp"
#include "../h/console.hpp"

void Riscv::popSppSpie()
{
    800026dc:	ff010113          	addi	sp,sp,-16
    800026e0:	00813423          	sd	s0,8(sp)
    800026e4:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sepc, ra");
    800026e8:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    800026ec:	10200073          	sret
}
    800026f0:	00813403          	ld	s0,8(sp)
    800026f4:	01010113          	addi	sp,sp,16
    800026f8:	00008067          	ret

00000000800026fc <_ZN5Riscv12wakeupThreadEv>:

void Riscv::wakeupThread() {
    if(!TCB::sleepHead) return;
    800026fc:	00009797          	auipc	a5,0x9
    80002700:	09c7b783          	ld	a5,156(a5) # 8000b798 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002704:	0007b783          	ld	a5,0(a5)
    80002708:	08078e63          	beqz	a5,800027a4 <_ZN5Riscv12wakeupThreadEv+0xa8>
void Riscv::wakeupThread() {
    8000270c:	fe010113          	addi	sp,sp,-32
    80002710:	00113c23          	sd	ra,24(sp)
    80002714:	00813823          	sd	s0,16(sp)
    80002718:	00913423          	sd	s1,8(sp)
    8000271c:	01213023          	sd	s2,0(sp)
    80002720:	02010413          	addi	s0,sp,32
    TCB::sleepHead->sleepTime--;
    80002724:	0087b703          	ld	a4,8(a5)
    80002728:	fff70713          	addi	a4,a4,-1
    8000272c:	00e7b423          	sd	a4,8(a5)
    while(TCB::sleepHead && TCB::sleepHead->sleepTime == 0){
    80002730:	00009797          	auipc	a5,0x9
    80002734:	0687b783          	ld	a5,104(a5) # 8000b798 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002738:	0007b483          	ld	s1,0(a5)
    8000273c:	04048863          	beqz	s1,8000278c <_ZN5Riscv12wakeupThreadEv+0x90>
    80002740:	0084b783          	ld	a5,8(s1)
    80002744:	04079463          	bnez	a5,8000278c <_ZN5Riscv12wakeupThreadEv+0x90>
        Sleep* removed = TCB::sleepHead;
        TCB::sleepHead = TCB::sleepHead->next;
    80002748:	0104b703          	ld	a4,16(s1)
    8000274c:	00009797          	auipc	a5,0x9
    80002750:	04c7b783          	ld	a5,76(a5) # 8000b798 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002754:	00e7b023          	sd	a4,0(a5)
        TCB* thread = removed->thread;
    80002758:	0004b903          	ld	s2,0(s1)
    void setBlocked(bool value) { blocked = value; }
    8000275c:	020904a3          	sb	zero,41(s2)
        thread->setBlocked(false);
        MemoryAllocator::instance().mem_free(removed);
    80002760:	00000097          	auipc	ra,0x0
    80002764:	4ac080e7          	jalr	1196(ra) # 80002c0c <_ZN15MemoryAllocator8instanceEv>
    80002768:	00048593          	mv	a1,s1
    8000276c:	00000097          	auipc	ra,0x0
    80002770:	624080e7          	jalr	1572(ra) # 80002d90 <_ZN15MemoryAllocator8mem_freeEPv>
        Scheduler::instanceOfScheduler().put(thread);
    80002774:	fffff097          	auipc	ra,0xfffff
    80002778:	260080e7          	jalr	608(ra) # 800019d4 <_ZN9Scheduler19instanceOfSchedulerEv>
    8000277c:	00090593          	mv	a1,s2
    80002780:	fffff097          	auipc	ra,0xfffff
    80002784:	274080e7          	jalr	628(ra) # 800019f4 <_ZN9Scheduler3putEP3TCB>
    while(TCB::sleepHead && TCB::sleepHead->sleepTime == 0){
    80002788:	fa9ff06f          	j	80002730 <_ZN5Riscv12wakeupThreadEv+0x34>
    }
}
    8000278c:	01813083          	ld	ra,24(sp)
    80002790:	01013403          	ld	s0,16(sp)
    80002794:	00813483          	ld	s1,8(sp)
    80002798:	00013903          	ld	s2,0(sp)
    8000279c:	02010113          	addi	sp,sp,32
    800027a0:	00008067          	ret
    800027a4:	00008067          	ret

00000000800027a8 <_ZN5Riscv15handleInterruptEv>:

void Riscv::handleInterrupt() {
    800027a8:	f8010113          	addi	sp,sp,-128
    800027ac:	06113c23          	sd	ra,120(sp)
    800027b0:	06813823          	sd	s0,112(sp)
    800027b4:	06913423          	sd	s1,104(sp)
    800027b8:	07213023          	sd	s2,96(sp)
    800027bc:	05313c23          	sd	s3,88(sp)
    800027c0:	05413823          	sd	s4,80(sp)
    800027c4:	08010413          	addi	s0,sp,128
    __asm__ volatile ("mv %[a0], a0" : [a0] "=r"(a0));
    800027c8:	00050793          	mv	a5,a0
    800027cc:	faf43c23          	sd	a5,-72(s0)
    return a0;
    800027d0:	fb843483          	ld	s1,-72(s0)
    __asm__ volatile ("mv %[a1], a1" : [a1] "=r"(a1));
    800027d4:	00058793          	mv	a5,a1
    800027d8:	faf43823          	sd	a5,-80(s0)
    return a1;
    800027dc:	fb043903          	ld	s2,-80(s0)
    __asm__ volatile ("mv %[a2], a2" : [a2] "=r"(a2));
    800027e0:	00060793          	mv	a5,a2
    800027e4:	faf43423          	sd	a5,-88(s0)
    return a2;
    800027e8:	fa843983          	ld	s3,-88(s0)
    __asm__ volatile ("ld %0, 104(s0)" : "=r"(a3));
    800027ec:	06843783          	ld	a5,104(s0)
    800027f0:	faf43023          	sd	a5,-96(s0)
    return a3;
    800027f4:	fa043a03          	ld	s4,-96(s0)
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    800027f8:	142027f3          	csrr	a5,scause
    800027fc:	f8f43c23          	sd	a5,-104(s0)
    return scause;
    80002800:	f9843783          	ld	a5,-104(s0)
    uint64 a2 = r_a2();
    uint64 a3 = r_a3();

    uint64 scause = r_scause();

    if(scause == 0x0000000000000008UL || scause == 0x0000000000000009UL) {
    80002804:	ff878793          	addi	a5,a5,-8
    80002808:	00100713          	li	a4,1
    8000280c:	02f77263          	bgeu	a4,a5,80002830 <_ZN5Riscv15handleInterruptEv+0x88>
        //__asm__ volatile ("addi sp, sp, 16");

        w_sstatus(sstatus);
        w_sepc(sepc);
    }
}
    80002810:	07813083          	ld	ra,120(sp)
    80002814:	07013403          	ld	s0,112(sp)
    80002818:	06813483          	ld	s1,104(sp)
    8000281c:	06013903          	ld	s2,96(sp)
    80002820:	05813983          	ld	s3,88(sp)
    80002824:	05013a03          	ld	s4,80(sp)
    80002828:	08010113          	addi	sp,sp,128
    8000282c:	00008067          	ret
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002830:	141027f3          	csrr	a5,sepc
    80002834:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    80002838:	fc843783          	ld	a5,-56(s0)
        uint64 volatile sepc = r_sepc() + 4;
    8000283c:	00478793          	addi	a5,a5,4
    80002840:	f8f43423          	sd	a5,-120(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002844:	100027f3          	csrr	a5,sstatus
    80002848:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    8000284c:	fc043783          	ld	a5,-64(s0)
        uint64 volatile sstatus = r_sstatus();
    80002850:	f8f43823          	sd	a5,-112(s0)
        if (a0 == 0x01) {
    80002854:	00100793          	li	a5,1
    80002858:	08f48663          	beq	s1,a5,800028e4 <_ZN5Riscv15handleInterruptEv+0x13c>
        } else if (a0 == 0x02) {
    8000285c:	00200793          	li	a5,2
    80002860:	0af48a63          	beq	s1,a5,80002914 <_ZN5Riscv15handleInterruptEv+0x16c>
        } else if (a0 == 0x11) {
    80002864:	01100793          	li	a5,17
    80002868:	0cf48263          	beq	s1,a5,8000292c <_ZN5Riscv15handleInterruptEv+0x184>
        } else if (a0 == 0x12) {
    8000286c:	01200793          	li	a5,18
    80002870:	10f48263          	beq	s1,a5,80002974 <_ZN5Riscv15handleInterruptEv+0x1cc>
        } else if (a0 == 0x14) {
    80002874:	01400793          	li	a5,20
    80002878:	10f48463          	beq	s1,a5,80002980 <_ZN5Riscv15handleInterruptEv+0x1d8>
        } else if (a0 == 0x15) {
    8000287c:	01500793          	li	a5,21
    80002880:	10f48e63          	beq	s1,a5,8000299c <_ZN5Riscv15handleInterruptEv+0x1f4>
        } else if (a0 == 0x21) {
    80002884:	02100793          	li	a5,33
    80002888:	14f48263          	beq	s1,a5,800029cc <_ZN5Riscv15handleInterruptEv+0x224>
        } else if (a0 == 0x22) {
    8000288c:	02200793          	li	a5,34
    80002890:	14f48863          	beq	s1,a5,800029e0 <_ZN5Riscv15handleInterruptEv+0x238>
        } else if (a0 == 0x23) {
    80002894:	02300793          	li	a5,35
    80002898:	16f48663          	beq	s1,a5,80002a04 <_ZN5Riscv15handleInterruptEv+0x25c>
        } else if (a0 == 0x24) {
    8000289c:	02400793          	li	a5,36
    800028a0:	16f48a63          	beq	s1,a5,80002a14 <_ZN5Riscv15handleInterruptEv+0x26c>
        } else if (a0 == 0x31) {
    800028a4:	03100793          	li	a5,49
    800028a8:	16f48e63          	beq	s1,a5,80002a24 <_ZN5Riscv15handleInterruptEv+0x27c>
        } else if (a0 == 0x41) {
    800028ac:	04100793          	li	a5,65
    800028b0:	18f48263          	beq	s1,a5,80002a34 <_ZN5Riscv15handleInterruptEv+0x28c>
        } else if (a0 == 0x42) {
    800028b4:	04200793          	li	a5,66
    800028b8:	18f48663          	beq	s1,a5,80002a44 <_ZN5Riscv15handleInterruptEv+0x29c>
        } else if (a0 == 0x43) {
    800028bc:	04300793          	li	a5,67
    800028c0:	02f49c63          	bne	s1,a5,800028f8 <_ZN5Riscv15handleInterruptEv+0x150>
            w_sstatus(sstatus);
    800028c4:	f9043783          	ld	a5,-112(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800028c8:	10079073          	csrw	sstatus,a5
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    800028cc:	10000793          	li	a5,256
    800028d0:	1007b073          	csrc	sstatus,a5
            __asm__ volatile("csrw sepc, %0" : : "r"(sepc));
    800028d4:	f8843783          	ld	a5,-120(s0)
    800028d8:	14179073          	csrw	sepc,a5
            __asm__ volatile("csrc sip, 0x02");
    800028dc:	14417073          	csrci	sip,2
            return;
    800028e0:	f31ff06f          	j	80002810 <_ZN5Riscv15handleInterruptEv+0x68>
            MemoryAllocator::instance().mem_alloc(size);
    800028e4:	00000097          	auipc	ra,0x0
    800028e8:	328080e7          	jalr	808(ra) # 80002c0c <_ZN15MemoryAllocator8instanceEv>
    800028ec:	00090593          	mv	a1,s2
    800028f0:	00000097          	auipc	ra,0x0
    800028f4:	3e0080e7          	jalr	992(ra) # 80002cd0 <_ZN15MemoryAllocator9mem_allocEm>
        if (a0 == 0x13 && Scheduler::instanceOfScheduler().head) {
    800028f8:	01300793          	li	a5,19
    800028fc:	14f48c63          	beq	s1,a5,80002a54 <_ZN5Riscv15handleInterruptEv+0x2ac>
        w_sstatus(sstatus);
    80002900:	f9043783          	ld	a5,-112(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002904:	10079073          	csrw	sstatus,a5
        w_sepc(sepc);
    80002908:	f8843783          	ld	a5,-120(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    8000290c:	14179073          	csrw	sepc,a5
}
    80002910:	f01ff06f          	j	80002810 <_ZN5Riscv15handleInterruptEv+0x68>
            MemoryAllocator::instance().mem_free(ptr);
    80002914:	00000097          	auipc	ra,0x0
    80002918:	2f8080e7          	jalr	760(ra) # 80002c0c <_ZN15MemoryAllocator8instanceEv>
    8000291c:	00090593          	mv	a1,s2
    80002920:	00000097          	auipc	ra,0x0
    80002924:	470080e7          	jalr	1136(ra) # 80002d90 <_ZN15MemoryAllocator8mem_freeEPv>
    80002928:	fd1ff06f          	j	800028f8 <_ZN5Riscv15handleInterruptEv+0x150>
            char* stack_space = (char*) MemoryAllocator::instance().mem_alloc(
    8000292c:	00000097          	auipc	ra,0x0
    80002930:	2e0080e7          	jalr	736(ra) # 80002c0c <_ZN15MemoryAllocator8instanceEv>
    80002934:	20000593          	li	a1,512
    80002938:	00000097          	auipc	ra,0x0
    8000293c:	398080e7          	jalr	920(ra) # 80002cd0 <_ZN15MemoryAllocator9mem_allocEm>
    80002940:	00050613          	mv	a2,a0
            *handle = TCB::createThread(start_routine, arg, stack_space);
    80002944:	000a0593          	mv	a1,s4
    80002948:	00098513          	mv	a0,s3
    8000294c:	fffff097          	auipc	ra,0xfffff
    80002950:	564080e7          	jalr	1380(ra) # 80001eb0 <_ZN3TCB12createThreadEPFvPvES0_Pc>
    80002954:	00a93023          	sd	a0,0(s2)
            if (start_routine != nullptr) {
    80002958:	fa0980e3          	beqz	s3,800028f8 <_ZN5Riscv15handleInterruptEv+0x150>
                Scheduler::instanceOfScheduler().put(*handle);
    8000295c:	fffff097          	auipc	ra,0xfffff
    80002960:	078080e7          	jalr	120(ra) # 800019d4 <_ZN9Scheduler19instanceOfSchedulerEv>
    80002964:	00093583          	ld	a1,0(s2)
    80002968:	fffff097          	auipc	ra,0xfffff
    8000296c:	08c080e7          	jalr	140(ra) # 800019f4 <_ZN9Scheduler3putEP3TCB>
    80002970:	f89ff06f          	j	800028f8 <_ZN5Riscv15handleInterruptEv+0x150>
            TCB::exit();
    80002974:	fffff097          	auipc	ra,0xfffff
    80002978:	658080e7          	jalr	1624(ra) # 80001fcc <_ZN3TCB4exitEv>
    8000297c:	f7dff06f          	j	800028f8 <_ZN5Riscv15handleInterruptEv+0x150>
            TCB::running->join(handle);
    80002980:	00090593          	mv	a1,s2
    80002984:	00009797          	auipc	a5,0x9
    80002988:	e3c7b783          	ld	a5,-452(a5) # 8000b7c0 <_GLOBAL_OFFSET_TABLE_+0x68>
    8000298c:	0007b503          	ld	a0,0(a5)
    80002990:	fffff097          	auipc	ra,0xfffff
    80002994:	6e0080e7          	jalr	1760(ra) # 80002070 <_ZN3TCB4joinEPS_>
    80002998:	f61ff06f          	j	800028f8 <_ZN5Riscv15handleInterruptEv+0x150>
            char* stack_space = (char*) MemoryAllocator::instance().mem_alloc(
    8000299c:	00000097          	auipc	ra,0x0
    800029a0:	270080e7          	jalr	624(ra) # 80002c0c <_ZN15MemoryAllocator8instanceEv>
    800029a4:	20000593          	li	a1,512
    800029a8:	00000097          	auipc	ra,0x0
    800029ac:	328080e7          	jalr	808(ra) # 80002cd0 <_ZN15MemoryAllocator9mem_allocEm>
    800029b0:	00050613          	mv	a2,a0
            *handle = TCB::createThread(start_routine, arg, stack_space);
    800029b4:	000a0593          	mv	a1,s4
    800029b8:	00098513          	mv	a0,s3
    800029bc:	fffff097          	auipc	ra,0xfffff
    800029c0:	4f4080e7          	jalr	1268(ra) # 80001eb0 <_ZN3TCB12createThreadEPFvPvES0_Pc>
    800029c4:	00a93023          	sd	a0,0(s2)
    800029c8:	f31ff06f          	j	800028f8 <_ZN5Riscv15handleInterruptEv+0x150>
            *handle = semaphore::open(init);
    800029cc:	0009851b          	sext.w	a0,s3
    800029d0:	fffff097          	auipc	ra,0xfffff
    800029d4:	dd0080e7          	jalr	-560(ra) # 800017a0 <_ZN9semaphore4openEi>
    800029d8:	00a93023          	sd	a0,0(s2)
    800029dc:	f1dff06f          	j	800028f8 <_ZN5Riscv15handleInterruptEv+0x150>
            handle->close();
    800029e0:	00090513          	mv	a0,s2
    800029e4:	fffff097          	auipc	ra,0xfffff
    800029e8:	e08080e7          	jalr	-504(ra) # 800017ec <_ZN9semaphore5closeEv>
            MemoryAllocator::instance().mem_free(handle);
    800029ec:	00000097          	auipc	ra,0x0
    800029f0:	220080e7          	jalr	544(ra) # 80002c0c <_ZN15MemoryAllocator8instanceEv>
    800029f4:	00090593          	mv	a1,s2
    800029f8:	00000097          	auipc	ra,0x0
    800029fc:	398080e7          	jalr	920(ra) # 80002d90 <_ZN15MemoryAllocator8mem_freeEPv>
    80002a00:	ef9ff06f          	j	800028f8 <_ZN5Riscv15handleInterruptEv+0x150>
            handle->wait();
    80002a04:	00090513          	mv	a0,s2
    80002a08:	fffff097          	auipc	ra,0xfffff
    80002a0c:	f04080e7          	jalr	-252(ra) # 8000190c <_ZN9semaphore4waitEv>
    80002a10:	ee9ff06f          	j	800028f8 <_ZN5Riscv15handleInterruptEv+0x150>
            handle->signal();
    80002a14:	00090513          	mv	a0,s2
    80002a18:	fffff097          	auipc	ra,0xfffff
    80002a1c:	e48080e7          	jalr	-440(ra) # 80001860 <_ZN9semaphore6signalEv>
    80002a20:	ed9ff06f          	j	800028f8 <_ZN5Riscv15handleInterruptEv+0x150>
            TCB::sleep(timeSleep);
    80002a24:	00090513          	mv	a0,s2
    80002a28:	fffff097          	auipc	ra,0xfffff
    80002a2c:	6c0080e7          	jalr	1728(ra) # 800020e8 <_ZN3TCB5sleepEm>
    80002a30:	ec9ff06f          	j	800028f8 <_ZN5Riscv15handleInterruptEv+0x150>
            char c = console::getFromInputBuffer();
    80002a34:	fffff097          	auipc	ra,0xfffff
    80002a38:	2d8080e7          	jalr	728(ra) # 80001d0c <_ZN7console18getFromInputBufferEv>
            __asm__ volatile ("mv a0, %[p]" : : [p]"r"(c));
    80002a3c:	00050513          	mv	a0,a0
    80002a40:	eb9ff06f          	j	800028f8 <_ZN5Riscv15handleInterruptEv+0x150>
            console::putInOutputBuffer(c);
    80002a44:	0ff97513          	andi	a0,s2,255
    80002a48:	fffff097          	auipc	ra,0xfffff
    80002a4c:	2f8080e7          	jalr	760(ra) # 80001d40 <_ZN7console17putInOutputBufferEc>
    80002a50:	ea9ff06f          	j	800028f8 <_ZN5Riscv15handleInterruptEv+0x150>
        if (a0 == 0x13 && Scheduler::instanceOfScheduler().head) {
    80002a54:	fffff097          	auipc	ra,0xfffff
    80002a58:	f80080e7          	jalr	-128(ra) # 800019d4 <_ZN9Scheduler19instanceOfSchedulerEv>
    80002a5c:	00853783          	ld	a5,8(a0)
    80002a60:	ea0780e3          	beqz	a5,80002900 <_ZN5Riscv15handleInterruptEv+0x158>
            TCB::timeSliceCounter = 0;
    80002a64:	00009797          	auipc	a5,0x9
    80002a68:	d247b783          	ld	a5,-732(a5) # 8000b788 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002a6c:	0007b023          	sd	zero,0(a5)
            TCB::dispatch();
    80002a70:	fffff097          	auipc	ra,0xfffff
    80002a74:	4dc080e7          	jalr	1244(ra) # 80001f4c <_ZN3TCB8dispatchEv>
    80002a78:	e89ff06f          	j	80002900 <_ZN5Riscv15handleInterruptEv+0x158>

0000000080002a7c <_ZN5Riscv11handleTimerEv>:

//Kod uzet sa sedmih vezbi.
void Riscv::handleTimer() {
    80002a7c:	fd010113          	addi	sp,sp,-48
    80002a80:	02113423          	sd	ra,40(sp)
    80002a84:	02813023          	sd	s0,32(sp)
    80002a88:	03010413          	addi	s0,sp,48
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80002a8c:	00200793          	li	a5,2
    80002a90:	1447b073          	csrc	sip,a5
    mc_sip(SIP_SSIP);
    TCB::timeSliceCounter++;
    80002a94:	00009717          	auipc	a4,0x9
    80002a98:	cf473703          	ld	a4,-780(a4) # 8000b788 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002a9c:	00073783          	ld	a5,0(a4)
    80002aa0:	00178793          	addi	a5,a5,1
    80002aa4:	00f73023          	sd	a5,0(a4)
    wakeupThread();
    80002aa8:	00000097          	auipc	ra,0x0
    80002aac:	c54080e7          	jalr	-940(ra) # 800026fc <_ZN5Riscv12wakeupThreadEv>
    if (TCB::running && TCB::timeSliceCounter >= TCB::running->getTimeSlice())
    80002ab0:	00009797          	auipc	a5,0x9
    80002ab4:	d107b783          	ld	a5,-752(a5) # 8000b7c0 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002ab8:	0007b783          	ld	a5,0(a5)
    80002abc:	04078463          	beqz	a5,80002b04 <_ZN5Riscv11handleTimerEv+0x88>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002ac0:	141027f3          	csrr	a5,sepc
    80002ac4:	fef43423          	sd	a5,-24(s0)
    return sepc;
    80002ac8:	fe843783          	ld	a5,-24(s0)
    {
        uint64 volatile sepc = r_sepc();
    80002acc:	fcf43823          	sd	a5,-48(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002ad0:	100027f3          	csrr	a5,sstatus
    80002ad4:	fef43023          	sd	a5,-32(s0)
    return sstatus;
    80002ad8:	fe043783          	ld	a5,-32(s0)
        uint64 volatile sstatus = r_sstatus();
    80002adc:	fcf43c23          	sd	a5,-40(s0)
        TCB::timeSliceCounter = 0;
    80002ae0:	00009797          	auipc	a5,0x9
    80002ae4:	ca87b783          	ld	a5,-856(a5) # 8000b788 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002ae8:	0007b023          	sd	zero,0(a5)
        TCB::dispatch();
    80002aec:	fffff097          	auipc	ra,0xfffff
    80002af0:	460080e7          	jalr	1120(ra) # 80001f4c <_ZN3TCB8dispatchEv>
        w_sstatus(sstatus);
    80002af4:	fd843783          	ld	a5,-40(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002af8:	10079073          	csrw	sstatus,a5
        w_sepc(sepc);
    80002afc:	fd043783          	ld	a5,-48(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002b00:	14179073          	csrw	sepc,a5
    }
}
    80002b04:	02813083          	ld	ra,40(sp)
    80002b08:	02013403          	ld	s0,32(sp)
    80002b0c:	03010113          	addi	sp,sp,48
    80002b10:	00008067          	ret

0000000080002b14 <_ZN5Riscv13handleConsoleEv>:

void Riscv::handleConsole() {
    80002b14:	fd010113          	addi	sp,sp,-48
    80002b18:	02113423          	sd	ra,40(sp)
    80002b1c:	02813023          	sd	s0,32(sp)
    80002b20:	03010413          	addi	s0,sp,48
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002b24:	141027f3          	csrr	a5,sepc
    80002b28:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    80002b2c:	fd843783          	ld	a5,-40(s0)
    //console_handler();
    //return;
    uint64 volatile sepc = r_sepc();
    80002b30:	fef43423          	sd	a5,-24(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002b34:	100027f3          	csrr	a5,sstatus
    80002b38:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    80002b3c:	fd043783          	ld	a5,-48(s0)
    uint64 volatile sstatus = r_sstatus();
    80002b40:	fef43023          	sd	a5,-32(s0)
    if(plic_claim() == CONSOLE_IRQ){
    80002b44:	00004097          	auipc	ra,0x4
    80002b48:	4a0080e7          	jalr	1184(ra) # 80006fe4 <plic_claim>
    80002b4c:	00a00793          	li	a5,10
    80002b50:	02f50863          	beq	a0,a5,80002b80 <_ZN5Riscv13handleConsoleEv+0x6c>
        while(CONSOLE_RX_STATUS_BIT & (*(char*) CONSOLE_STATUS)){
            char c = *(char*) CONSOLE_RX_DATA;
            console::putInInputBuffer(c);
        }
    }
    plic_complete(CONSOLE_IRQ);
    80002b54:	00a00513          	li	a0,10
    80002b58:	00004097          	auipc	ra,0x4
    80002b5c:	4c4080e7          	jalr	1220(ra) # 8000701c <plic_complete>
    w_sstatus(sstatus);
    80002b60:	fe043783          	ld	a5,-32(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002b64:	10079073          	csrw	sstatus,a5
    w_sepc(sepc);
    80002b68:	fe843783          	ld	a5,-24(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002b6c:	14179073          	csrw	sepc,a5
}
    80002b70:	02813083          	ld	ra,40(sp)
    80002b74:	02013403          	ld	s0,32(sp)
    80002b78:	03010113          	addi	sp,sp,48
    80002b7c:	00008067          	ret
        while(CONSOLE_RX_STATUS_BIT & (*(char*) CONSOLE_STATUS)){
    80002b80:	00009797          	auipc	a5,0x9
    80002b84:	bf07b783          	ld	a5,-1040(a5) # 8000b770 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002b88:	0007b783          	ld	a5,0(a5)
    80002b8c:	0007c783          	lbu	a5,0(a5)
    80002b90:	0017f793          	andi	a5,a5,1
    80002b94:	fc0780e3          	beqz	a5,80002b54 <_ZN5Riscv13handleConsoleEv+0x40>
            char c = *(char*) CONSOLE_RX_DATA;
    80002b98:	00009797          	auipc	a5,0x9
    80002b9c:	bd07b783          	ld	a5,-1072(a5) # 8000b768 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002ba0:	0007b783          	ld	a5,0(a5)
            console::putInInputBuffer(c);
    80002ba4:	0007c503          	lbu	a0,0(a5)
    80002ba8:	fffff097          	auipc	ra,0xfffff
    80002bac:	130080e7          	jalr	304(ra) # 80001cd8 <_ZN7console16putInInputBufferEc>
        while(CONSOLE_RX_STATUS_BIT & (*(char*) CONSOLE_STATUS)){
    80002bb0:	fd1ff06f          	j	80002b80 <_ZN5Riscv13handleConsoleEv+0x6c>

0000000080002bb4 <_ZN15MemoryAllocatorC1Ev>:
MemoryAllocator& MemoryAllocator::instance() {
    static MemoryAllocator singleton;
    return singleton;
}

MemoryAllocator::MemoryAllocator() {
    80002bb4:	ff010113          	addi	sp,sp,-16
    80002bb8:	00813423          	sd	s0,8(sp)
    80002bbc:	01010413          	addi	s0,sp,16
    80002bc0:	00053023          	sd	zero,0(a0)
    if(head == nullptr){
        head = (FreeMem*)(HEAP_START_ADDR);
    80002bc4:	00009717          	auipc	a4,0x9
    80002bc8:	bb473703          	ld	a4,-1100(a4) # 8000b778 <_GLOBAL_OFFSET_TABLE_+0x20>
    80002bcc:	00073783          	ld	a5,0(a4)
    80002bd0:	00f53023          	sd	a5,0(a0)
        head->next = nullptr;
    80002bd4:	0007b423          	sd	zero,8(a5)
        head->prev = nullptr;
    80002bd8:	00053783          	ld	a5,0(a0)
    80002bdc:	0007b023          	sd	zero,0(a5)
        head->size = (uint64)((uint64)HEAP_END_ADDR - (uint64)HEAP_START_ADDR - sizeof(FreeMem));
    80002be0:	00009797          	auipc	a5,0x9
    80002be4:	be87b783          	ld	a5,-1048(a5) # 8000b7c8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002be8:	0007b783          	ld	a5,0(a5)
    80002bec:	00073703          	ld	a4,0(a4)
    80002bf0:	40e787b3          	sub	a5,a5,a4
    80002bf4:	00053703          	ld	a4,0(a0)
    80002bf8:	fe878793          	addi	a5,a5,-24
    80002bfc:	00f73823          	sd	a5,16(a4)
    }
}
    80002c00:	00813403          	ld	s0,8(sp)
    80002c04:	01010113          	addi	sp,sp,16
    80002c08:	00008067          	ret

0000000080002c0c <_ZN15MemoryAllocator8instanceEv>:
    static MemoryAllocator singleton;
    80002c0c:	00009797          	auipc	a5,0x9
    80002c10:	c447c783          	lbu	a5,-956(a5) # 8000b850 <_ZGVZN15MemoryAllocator8instanceEvE9singleton>
    80002c14:	00078863          	beqz	a5,80002c24 <_ZN15MemoryAllocator8instanceEv+0x18>
}
    80002c18:	00009517          	auipc	a0,0x9
    80002c1c:	c4050513          	addi	a0,a0,-960 # 8000b858 <_ZZN15MemoryAllocator8instanceEvE9singleton>
    80002c20:	00008067          	ret
MemoryAllocator& MemoryAllocator::instance() {
    80002c24:	ff010113          	addi	sp,sp,-16
    80002c28:	00113423          	sd	ra,8(sp)
    80002c2c:	00813023          	sd	s0,0(sp)
    80002c30:	01010413          	addi	s0,sp,16
    static MemoryAllocator singleton;
    80002c34:	00009517          	auipc	a0,0x9
    80002c38:	c2450513          	addi	a0,a0,-988 # 8000b858 <_ZZN15MemoryAllocator8instanceEvE9singleton>
    80002c3c:	00000097          	auipc	ra,0x0
    80002c40:	f78080e7          	jalr	-136(ra) # 80002bb4 <_ZN15MemoryAllocatorC1Ev>
    80002c44:	00100793          	li	a5,1
    80002c48:	00009717          	auipc	a4,0x9
    80002c4c:	c0f70423          	sb	a5,-1016(a4) # 8000b850 <_ZGVZN15MemoryAllocator8instanceEvE9singleton>
}
    80002c50:	00009517          	auipc	a0,0x9
    80002c54:	c0850513          	addi	a0,a0,-1016 # 8000b858 <_ZZN15MemoryAllocator8instanceEvE9singleton>
    80002c58:	00813083          	ld	ra,8(sp)
    80002c5c:	00013403          	ld	s0,0(sp)
    80002c60:	01010113          	addi	sp,sp,16
    80002c64:	00008067          	ret

0000000080002c68 <_ZN15MemoryAllocator9tryToJoinEP7FreeMem>:

int MemoryAllocator::tryToJoin(FreeMem *cur) {
    80002c68:	ff010113          	addi	sp,sp,-16
    80002c6c:	00813423          	sd	s0,8(sp)
    80002c70:	01010413          	addi	s0,sp,16
    if(!cur) return 0;
    80002c74:	04058663          	beqz	a1,80002cc0 <_ZN15MemoryAllocator9tryToJoinEP7FreeMem+0x58>
    if(cur->next && (uint64)cur + cur->size == (uint64)(cur->next)) {
    80002c78:	0085b783          	ld	a5,8(a1)
    80002c7c:	04078663          	beqz	a5,80002cc8 <_ZN15MemoryAllocator9tryToJoinEP7FreeMem+0x60>
    80002c80:	0105b703          	ld	a4,16(a1)
    80002c84:	00e586b3          	add	a3,a1,a4
    80002c88:	00f68a63          	beq	a3,a5,80002c9c <_ZN15MemoryAllocator9tryToJoinEP7FreeMem+0x34>
        cur->size += cur->next->size;
        cur->next = cur->next->next;
        if (cur->next) cur->next->prev = cur;
        return 1;
    } else return 0;
    80002c8c:	00000513          	li	a0,0
}
    80002c90:	00813403          	ld	s0,8(sp)
    80002c94:	01010113          	addi	sp,sp,16
    80002c98:	00008067          	ret
        cur->size += cur->next->size;
    80002c9c:	0107b683          	ld	a3,16(a5)
    80002ca0:	00d70733          	add	a4,a4,a3
    80002ca4:	00e5b823          	sd	a4,16(a1)
        cur->next = cur->next->next;
    80002ca8:	0087b783          	ld	a5,8(a5)
    80002cac:	00f5b423          	sd	a5,8(a1)
        if (cur->next) cur->next->prev = cur;
    80002cb0:	00078463          	beqz	a5,80002cb8 <_ZN15MemoryAllocator9tryToJoinEP7FreeMem+0x50>
    80002cb4:	00b7b023          	sd	a1,0(a5)
        return 1;
    80002cb8:	00100513          	li	a0,1
    80002cbc:	fd5ff06f          	j	80002c90 <_ZN15MemoryAllocator9tryToJoinEP7FreeMem+0x28>
    if(!cur) return 0;
    80002cc0:	00000513          	li	a0,0
    80002cc4:	fcdff06f          	j	80002c90 <_ZN15MemoryAllocator9tryToJoinEP7FreeMem+0x28>
    } else return 0;
    80002cc8:	00000513          	li	a0,0
    80002ccc:	fc5ff06f          	j	80002c90 <_ZN15MemoryAllocator9tryToJoinEP7FreeMem+0x28>

0000000080002cd0 <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc(size_t size) {
    80002cd0:	ff010113          	addi	sp,sp,-16
    80002cd4:	00813423          	sd	s0,8(sp)
    80002cd8:	01010413          	addi	s0,sp,16
    80002cdc:	00050713          	mv	a4,a0
    //return __mem_alloc(size * MEM_BLOCK_SIZE);
    if(size < 0) return nullptr;
    //size = broj blokova
    size_t sz = size * MEM_BLOCK_SIZE + sizeof(FreeMem);
    80002ce0:	00659593          	slli	a1,a1,0x6
    80002ce4:	01858593          	addi	a1,a1,24

    for(FreeMem* cur = head; cur != nullptr; cur = cur->next){
    80002ce8:	00053503          	ld	a0,0(a0)
    80002cec:	08050863          	beqz	a0,80002d7c <_ZN15MemoryAllocator9mem_allocEm+0xac>
        if(cur->size >= sz){
    80002cf0:	01053783          	ld	a5,16(a0)
    80002cf4:	00b7f663          	bgeu	a5,a1,80002d00 <_ZN15MemoryAllocator9mem_allocEm+0x30>
    for(FreeMem* cur = head; cur != nullptr; cur = cur->next){
    80002cf8:	00853503          	ld	a0,8(a0)
    80002cfc:	ff1ff06f          	j	80002cec <_ZN15MemoryAllocator9mem_allocEm+0x1c>
            if(cur->size - sz <= sizeof(FreeMem)){
    80002d00:	40b787b3          	sub	a5,a5,a1
    80002d04:	01800693          	li	a3,24
    80002d08:	02f6ea63          	bltu	a3,a5,80002d3c <_ZN15MemoryAllocator9mem_allocEm+0x6c>
                //Ukoliko je prostor koji ostaje manji od velicine FreeMem onda se prikljucuje alociranom bloku
                if(cur->prev) cur->prev->next = cur->next;
    80002d0c:	00053783          	ld	a5,0(a0)
    80002d10:	02078063          	beqz	a5,80002d30 <_ZN15MemoryAllocator9mem_allocEm+0x60>
    80002d14:	00853703          	ld	a4,8(a0)
    80002d18:	00e7b423          	sd	a4,8(a5)
                else head = cur->next;
                if(cur->next) cur->next->prev = cur->prev;
    80002d1c:	00853783          	ld	a5,8(a0)
    80002d20:	04078a63          	beqz	a5,80002d74 <_ZN15MemoryAllocator9mem_allocEm+0xa4>
    80002d24:	00053703          	ld	a4,0(a0)
    80002d28:	00e7b023          	sd	a4,0(a5)
    80002d2c:	0480006f          	j	80002d74 <_ZN15MemoryAllocator9mem_allocEm+0xa4>
                else head = cur->next;
    80002d30:	00853783          	ld	a5,8(a0)
    80002d34:	00f73023          	sd	a5,0(a4)
    80002d38:	fe5ff06f          	j	80002d1c <_ZN15MemoryAllocator9mem_allocEm+0x4c>
            }
            else {
                //U suprotnom u listu slobodnih blokova dodaje se novi cija je velicina (cur->size - sz)
                FreeMem* newFragment = (FreeMem*)((uint64)cur + sz);
    80002d3c:	00b507b3          	add	a5,a0,a1
                if(cur->prev) cur->prev->next = newFragment;
    80002d40:	00053683          	ld	a3,0(a0)
    80002d44:	04068263          	beqz	a3,80002d88 <_ZN15MemoryAllocator9mem_allocEm+0xb8>
    80002d48:	00f6b423          	sd	a5,8(a3)
                else head = newFragment;
                if(cur->next) cur->next->prev = newFragment;
    80002d4c:	00853703          	ld	a4,8(a0)
    80002d50:	00070463          	beqz	a4,80002d58 <_ZN15MemoryAllocator9mem_allocEm+0x88>
    80002d54:	00f73023          	sd	a5,0(a4)
                newFragment->prev = cur->prev;
    80002d58:	00053703          	ld	a4,0(a0)
    80002d5c:	00e7b023          	sd	a4,0(a5)
                newFragment->next = cur->next;
    80002d60:	00853703          	ld	a4,8(a0)
    80002d64:	00e7b423          	sd	a4,8(a5)
                newFragment->size = cur->size - sz;
    80002d68:	01053703          	ld	a4,16(a0)
    80002d6c:	40b70733          	sub	a4,a4,a1
    80002d70:	00e7b823          	sd	a4,16(a5)

            }
            cur->size = sz;
    80002d74:	00b53823          	sd	a1,16(a0)
            return (char*)cur + sizeof(FreeMem);
    80002d78:	01850513          	addi	a0,a0,24
        }
    }
    return nullptr;
}
    80002d7c:	00813403          	ld	s0,8(sp)
    80002d80:	01010113          	addi	sp,sp,16
    80002d84:	00008067          	ret
                else head = newFragment;
    80002d88:	00f73023          	sd	a5,0(a4)
    80002d8c:	fc1ff06f          	j	80002d4c <_ZN15MemoryAllocator9mem_allocEm+0x7c>

0000000080002d90 <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free(void *addr) {
    //return __mem_free(addr);
    if(addr == nullptr || (uint64)addr > (uint64)HEAP_END_ADDR || (uint64)addr < (uint64)HEAP_START_ADDR) return -1;
    80002d90:	0e058463          	beqz	a1,80002e78 <_ZN15MemoryAllocator8mem_freeEPv+0xe8>
int MemoryAllocator::mem_free(void *addr) {
    80002d94:	fe010113          	addi	sp,sp,-32
    80002d98:	00113c23          	sd	ra,24(sp)
    80002d9c:	00813823          	sd	s0,16(sp)
    80002da0:	00913423          	sd	s1,8(sp)
    80002da4:	01213023          	sd	s2,0(sp)
    80002da8:	02010413          	addi	s0,sp,32
    80002dac:	00050913          	mv	s2,a0
    80002db0:	00058713          	mv	a4,a1
    if(addr == nullptr || (uint64)addr > (uint64)HEAP_END_ADDR || (uint64)addr < (uint64)HEAP_START_ADDR) return -1;
    80002db4:	00058693          	mv	a3,a1
    80002db8:	00009797          	auipc	a5,0x9
    80002dbc:	a107b783          	ld	a5,-1520(a5) # 8000b7c8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002dc0:	0007b783          	ld	a5,0(a5)
    80002dc4:	0ab7ee63          	bltu	a5,a1,80002e80 <_ZN15MemoryAllocator8mem_freeEPv+0xf0>
    80002dc8:	00009797          	auipc	a5,0x9
    80002dcc:	9b07b783          	ld	a5,-1616(a5) # 8000b778 <_GLOBAL_OFFSET_TABLE_+0x20>
    80002dd0:	0007b783          	ld	a5,0(a5)
    80002dd4:	0af5ea63          	bltu	a1,a5,80002e88 <_ZN15MemoryAllocator8mem_freeEPv+0xf8>

    FreeMem* cur = nullptr;
    if(!head || (uint64)addr < (uint64)head) cur = nullptr;
    80002dd8:	00053783          	ld	a5,0(a0)
    80002ddc:	00078e63          	beqz	a5,80002df8 <_ZN15MemoryAllocator8mem_freeEPv+0x68>
    80002de0:	02f5e063          	bltu	a1,a5,80002e00 <_ZN15MemoryAllocator8mem_freeEPv+0x70>
    else {
        //Cvorovi liste slobodnih blokova uredjeni su po adresama
        for(cur = head; cur->next != 0 && (uint64)addr > (uint64)cur->next; cur = cur->next);
    80002de4:	00078493          	mv	s1,a5
    80002de8:	0087b783          	ld	a5,8(a5)
    80002dec:	00078c63          	beqz	a5,80002e04 <_ZN15MemoryAllocator8mem_freeEPv+0x74>
    80002df0:	fed7eae3          	bltu	a5,a3,80002de4 <_ZN15MemoryAllocator8mem_freeEPv+0x54>
    80002df4:	0100006f          	j	80002e04 <_ZN15MemoryAllocator8mem_freeEPv+0x74>
    if(!head || (uint64)addr < (uint64)head) cur = nullptr;
    80002df8:	00078493          	mv	s1,a5
    80002dfc:	0080006f          	j	80002e04 <_ZN15MemoryAllocator8mem_freeEPv+0x74>
    80002e00:	00000493          	li	s1,0
    }

    FreeMem* blk = (FreeMem*)((uint64)addr - sizeof(FreeMem));
    80002e04:	fe870593          	addi	a1,a4,-24
    blk->prev = cur;
    80002e08:	fe973423          	sd	s1,-24(a4)
    if(cur) blk->next = cur->next;
    80002e0c:	04048c63          	beqz	s1,80002e64 <_ZN15MemoryAllocator8mem_freeEPv+0xd4>
    80002e10:	0084b783          	ld	a5,8(s1)
    80002e14:	00f5b423          	sd	a5,8(a1)
    else blk->next = head;
    if(blk->next) blk->next->prev = blk;
    80002e18:	0085b783          	ld	a5,8(a1)
    80002e1c:	00078463          	beqz	a5,80002e24 <_ZN15MemoryAllocator8mem_freeEPv+0x94>
    80002e20:	00b7b023          	sd	a1,0(a5)
    if(cur) cur->next = blk;
    80002e24:	04048663          	beqz	s1,80002e70 <_ZN15MemoryAllocator8mem_freeEPv+0xe0>
    80002e28:	00b4b423          	sd	a1,8(s1)
    else head = blk;

    tryToJoin(blk);
    80002e2c:	00090513          	mv	a0,s2
    80002e30:	00000097          	auipc	ra,0x0
    80002e34:	e38080e7          	jalr	-456(ra) # 80002c68 <_ZN15MemoryAllocator9tryToJoinEP7FreeMem>
    tryToJoin(cur);
    80002e38:	00048593          	mv	a1,s1
    80002e3c:	00090513          	mv	a0,s2
    80002e40:	00000097          	auipc	ra,0x0
    80002e44:	e28080e7          	jalr	-472(ra) # 80002c68 <_ZN15MemoryAllocator9tryToJoinEP7FreeMem>
    return 0;
    80002e48:	00000513          	li	a0,0
}
    80002e4c:	01813083          	ld	ra,24(sp)
    80002e50:	01013403          	ld	s0,16(sp)
    80002e54:	00813483          	ld	s1,8(sp)
    80002e58:	00013903          	ld	s2,0(sp)
    80002e5c:	02010113          	addi	sp,sp,32
    80002e60:	00008067          	ret
    else blk->next = head;
    80002e64:	00093783          	ld	a5,0(s2)
    80002e68:	00f5b423          	sd	a5,8(a1)
    80002e6c:	fadff06f          	j	80002e18 <_ZN15MemoryAllocator8mem_freeEPv+0x88>
    else head = blk;
    80002e70:	00b93023          	sd	a1,0(s2)
    80002e74:	fb9ff06f          	j	80002e2c <_ZN15MemoryAllocator8mem_freeEPv+0x9c>
    if(addr == nullptr || (uint64)addr > (uint64)HEAP_END_ADDR || (uint64)addr < (uint64)HEAP_START_ADDR) return -1;
    80002e78:	fff00513          	li	a0,-1
}
    80002e7c:	00008067          	ret
    if(addr == nullptr || (uint64)addr > (uint64)HEAP_END_ADDR || (uint64)addr < (uint64)HEAP_START_ADDR) return -1;
    80002e80:	fff00513          	li	a0,-1
    80002e84:	fc9ff06f          	j	80002e4c <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    80002e88:	fff00513          	li	a0,-1
    80002e8c:	fc1ff06f          	j	80002e4c <_ZN15MemoryAllocator8mem_freeEPv+0xbc>

0000000080002e90 <_ZN6bufferC1Ei>:
#include "../h/buffer.h"

buffer::buffer(int kapacitet) {
    80002e90:	fe010113          	addi	sp,sp,-32
    80002e94:	00113c23          	sd	ra,24(sp)
    80002e98:	00813823          	sd	s0,16(sp)
    80002e9c:	00913423          	sd	s1,8(sp)
    80002ea0:	01213023          	sd	s2,0(sp)
    80002ea4:	02010413          	addi	s0,sp,32
    80002ea8:	00050493          	mv	s1,a0
    80002eac:	00058913          	mv	s2,a1
    this->kapacitet = kapacitet;
    80002eb0:	00b52023          	sw	a1,0(a0)
    this->buff = (char*) mem_alloc(sizeof (char) * kapacitet);
    80002eb4:	00058513          	mv	a0,a1
    80002eb8:	ffffe097          	auipc	ra,0xffffe
    80002ebc:	4f0080e7          	jalr	1264(ra) # 800013a8 <_Z9mem_allocm>
    80002ec0:	00a4b823          	sd	a0,16(s1)
    head = tail = 0;
    80002ec4:	0004a423          	sw	zero,8(s1)
    80002ec8:	0004a223          	sw	zero,4(s1)
    spaceAvilable = semaphore::open(kapacitet);
    80002ecc:	00090513          	mv	a0,s2
    80002ed0:	fffff097          	auipc	ra,0xfffff
    80002ed4:	8d0080e7          	jalr	-1840(ra) # 800017a0 <_ZN9semaphore4openEi>
    80002ed8:	00a4bc23          	sd	a0,24(s1)
    itemAvailable = semaphore::open(0);
    80002edc:	00000513          	li	a0,0
    80002ee0:	fffff097          	auipc	ra,0xfffff
    80002ee4:	8c0080e7          	jalr	-1856(ra) # 800017a0 <_ZN9semaphore4openEi>
    80002ee8:	02a4b023          	sd	a0,32(s1)
    mutexHead = semaphore::open(1);
    80002eec:	00100513          	li	a0,1
    80002ef0:	fffff097          	auipc	ra,0xfffff
    80002ef4:	8b0080e7          	jalr	-1872(ra) # 800017a0 <_ZN9semaphore4openEi>
    80002ef8:	02a4b423          	sd	a0,40(s1)
    mutexTail = semaphore::open(1);
    80002efc:	00100513          	li	a0,1
    80002f00:	fffff097          	auipc	ra,0xfffff
    80002f04:	8a0080e7          	jalr	-1888(ra) # 800017a0 <_ZN9semaphore4openEi>
    80002f08:	02a4b823          	sd	a0,48(s1)
}
    80002f0c:	01813083          	ld	ra,24(sp)
    80002f10:	01013403          	ld	s0,16(sp)
    80002f14:	00813483          	ld	s1,8(sp)
    80002f18:	00013903          	ld	s2,0(sp)
    80002f1c:	02010113          	addi	sp,sp,32
    80002f20:	00008067          	ret

0000000080002f24 <_ZN6buffer3putEc>:

void buffer::put(char c) {
    80002f24:	fe010113          	addi	sp,sp,-32
    80002f28:	00113c23          	sd	ra,24(sp)
    80002f2c:	00813823          	sd	s0,16(sp)
    80002f30:	00913423          	sd	s1,8(sp)
    80002f34:	01213023          	sd	s2,0(sp)
    80002f38:	02010413          	addi	s0,sp,32
    80002f3c:	00050493          	mv	s1,a0
    80002f40:	00058913          	mv	s2,a1
    spaceAvilable->wait();
    80002f44:	01853503          	ld	a0,24(a0)
    80002f48:	fffff097          	auipc	ra,0xfffff
    80002f4c:	9c4080e7          	jalr	-1596(ra) # 8000190c <_ZN9semaphore4waitEv>
    mutexTail->wait();
    80002f50:	0304b503          	ld	a0,48(s1)
    80002f54:	fffff097          	auipc	ra,0xfffff
    80002f58:	9b8080e7          	jalr	-1608(ra) # 8000190c <_ZN9semaphore4waitEv>

    buff[tail] = c;
    80002f5c:	0104b783          	ld	a5,16(s1)
    80002f60:	0084a703          	lw	a4,8(s1)
    80002f64:	00e787b3          	add	a5,a5,a4
    80002f68:	01278023          	sb	s2,0(a5)
    tail = (tail + 1)%kapacitet;
    80002f6c:	0084a783          	lw	a5,8(s1)
    80002f70:	0017879b          	addiw	a5,a5,1
    80002f74:	0004a703          	lw	a4,0(s1)
    80002f78:	02e7e7bb          	remw	a5,a5,a4
    80002f7c:	00f4a423          	sw	a5,8(s1)

    mutexTail->signal();
    80002f80:	0304b503          	ld	a0,48(s1)
    80002f84:	fffff097          	auipc	ra,0xfffff
    80002f88:	8dc080e7          	jalr	-1828(ra) # 80001860 <_ZN9semaphore6signalEv>
    itemAvailable->signal();
    80002f8c:	0204b503          	ld	a0,32(s1)
    80002f90:	fffff097          	auipc	ra,0xfffff
    80002f94:	8d0080e7          	jalr	-1840(ra) # 80001860 <_ZN9semaphore6signalEv>
}
    80002f98:	01813083          	ld	ra,24(sp)
    80002f9c:	01013403          	ld	s0,16(sp)
    80002fa0:	00813483          	ld	s1,8(sp)
    80002fa4:	00013903          	ld	s2,0(sp)
    80002fa8:	02010113          	addi	sp,sp,32
    80002fac:	00008067          	ret

0000000080002fb0 <_ZN6buffer3getEv>:

int buffer::get() {
    80002fb0:	fe010113          	addi	sp,sp,-32
    80002fb4:	00113c23          	sd	ra,24(sp)
    80002fb8:	00813823          	sd	s0,16(sp)
    80002fbc:	00913423          	sd	s1,8(sp)
    80002fc0:	01213023          	sd	s2,0(sp)
    80002fc4:	02010413          	addi	s0,sp,32
    80002fc8:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80002fcc:	02053503          	ld	a0,32(a0)
    80002fd0:	fffff097          	auipc	ra,0xfffff
    80002fd4:	93c080e7          	jalr	-1732(ra) # 8000190c <_ZN9semaphore4waitEv>
    mutexHead->wait();
    80002fd8:	0284b503          	ld	a0,40(s1)
    80002fdc:	fffff097          	auipc	ra,0xfffff
    80002fe0:	930080e7          	jalr	-1744(ra) # 8000190c <_ZN9semaphore4waitEv>

    char c = buff[head];
    80002fe4:	0104b703          	ld	a4,16(s1)
    80002fe8:	0044a783          	lw	a5,4(s1)
    80002fec:	00f70733          	add	a4,a4,a5
    80002ff0:	00074903          	lbu	s2,0(a4)
    head = (head + 1)%kapacitet;
    80002ff4:	0017879b          	addiw	a5,a5,1
    80002ff8:	0004a703          	lw	a4,0(s1)
    80002ffc:	02e7e7bb          	remw	a5,a5,a4
    80003000:	00f4a223          	sw	a5,4(s1)

    mutexHead->signal();
    80003004:	0284b503          	ld	a0,40(s1)
    80003008:	fffff097          	auipc	ra,0xfffff
    8000300c:	858080e7          	jalr	-1960(ra) # 80001860 <_ZN9semaphore6signalEv>
    spaceAvilable->signal();
    80003010:	0184b503          	ld	a0,24(s1)
    80003014:	fffff097          	auipc	ra,0xfffff
    80003018:	84c080e7          	jalr	-1972(ra) # 80001860 <_ZN9semaphore6signalEv>

    return c;
}
    8000301c:	00090513          	mv	a0,s2
    80003020:	01813083          	ld	ra,24(sp)
    80003024:	01013403          	ld	s0,16(sp)
    80003028:	00813483          	ld	s1,8(sp)
    8000302c:	00013903          	ld	s2,0(sp)
    80003030:	02010113          	addi	sp,sp,32
    80003034:	00008067          	ret

0000000080003038 <_ZN6buffer6getCntEv>:

int buffer::getCnt() {
    80003038:	fe010113          	addi	sp,sp,-32
    8000303c:	00113c23          	sd	ra,24(sp)
    80003040:	00813823          	sd	s0,16(sp)
    80003044:	00913423          	sd	s1,8(sp)
    80003048:	01213023          	sd	s2,0(sp)
    8000304c:	02010413          	addi	s0,sp,32
    80003050:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80003054:	02853503          	ld	a0,40(a0)
    80003058:	fffff097          	auipc	ra,0xfffff
    8000305c:	8b4080e7          	jalr	-1868(ra) # 8000190c <_ZN9semaphore4waitEv>
    mutexTail->wait();
    80003060:	0304b503          	ld	a0,48(s1)
    80003064:	fffff097          	auipc	ra,0xfffff
    80003068:	8a8080e7          	jalr	-1880(ra) # 8000190c <_ZN9semaphore4waitEv>

    if(tail >= head) ret = tail - head;
    8000306c:	0084a783          	lw	a5,8(s1)
    80003070:	0044a903          	lw	s2,4(s1)
    80003074:	0327ce63          	blt	a5,s2,800030b0 <_ZN6buffer6getCntEv+0x78>
    80003078:	4127893b          	subw	s2,a5,s2
    else ret = kapacitet - head + tail;

    mutexTail->signal();
    8000307c:	0304b503          	ld	a0,48(s1)
    80003080:	ffffe097          	auipc	ra,0xffffe
    80003084:	7e0080e7          	jalr	2016(ra) # 80001860 <_ZN9semaphore6signalEv>
    mutexHead->signal();
    80003088:	0284b503          	ld	a0,40(s1)
    8000308c:	ffffe097          	auipc	ra,0xffffe
    80003090:	7d4080e7          	jalr	2004(ra) # 80001860 <_ZN9semaphore6signalEv>
    return ret;
    80003094:	00090513          	mv	a0,s2
    80003098:	01813083          	ld	ra,24(sp)
    8000309c:	01013403          	ld	s0,16(sp)
    800030a0:	00813483          	ld	s1,8(sp)
    800030a4:	00013903          	ld	s2,0(sp)
    800030a8:	02010113          	addi	sp,sp,32
    800030ac:	00008067          	ret
    else ret = kapacitet - head + tail;
    800030b0:	0004a703          	lw	a4,0(s1)
    800030b4:	4127093b          	subw	s2,a4,s2
    800030b8:	00f9093b          	addw	s2,s2,a5
    800030bc:	fc1ff06f          	j	8000307c <_ZN6buffer6getCntEv+0x44>

00000000800030c0 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    800030c0:	fe010113          	addi	sp,sp,-32
    800030c4:	00113c23          	sd	ra,24(sp)
    800030c8:	00813823          	sd	s0,16(sp)
    800030cc:	00913423          	sd	s1,8(sp)
    800030d0:	01213023          	sd	s2,0(sp)
    800030d4:	02010413          	addi	s0,sp,32
    800030d8:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    800030dc:	00000913          	li	s2,0
    800030e0:	00c0006f          	j	800030ec <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800030e4:	ffffe097          	auipc	ra,0xffffe
    800030e8:	428080e7          	jalr	1064(ra) # 8000150c <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    800030ec:	ffffe097          	auipc	ra,0xffffe
    800030f0:	5f8080e7          	jalr	1528(ra) # 800016e4 <_Z4getcv>
    800030f4:	0005059b          	sext.w	a1,a0
    800030f8:	01b00793          	li	a5,27
    800030fc:	02f58a63          	beq	a1,a5,80003130 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003100:	0084b503          	ld	a0,8(s1)
    80003104:	00003097          	auipc	ra,0x3
    80003108:	400080e7          	jalr	1024(ra) # 80006504 <_ZN6Buffer3putEi>
        i++;
    8000310c:	0019071b          	addiw	a4,s2,1
    80003110:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003114:	0004a683          	lw	a3,0(s1)
    80003118:	0026979b          	slliw	a5,a3,0x2
    8000311c:	00d787bb          	addw	a5,a5,a3
    80003120:	0017979b          	slliw	a5,a5,0x1
    80003124:	02f767bb          	remw	a5,a4,a5
    80003128:	fc0792e3          	bnez	a5,800030ec <_ZL16producerKeyboardPv+0x2c>
    8000312c:	fb9ff06f          	j	800030e4 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80003130:	00100793          	li	a5,1
    80003134:	00008717          	auipc	a4,0x8
    80003138:	72f72623          	sw	a5,1836(a4) # 8000b860 <_ZL9threadEnd>
    data->buffer->put('!');
    8000313c:	02100593          	li	a1,33
    80003140:	0084b503          	ld	a0,8(s1)
    80003144:	00003097          	auipc	ra,0x3
    80003148:	3c0080e7          	jalr	960(ra) # 80006504 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    8000314c:	0104b503          	ld	a0,16(s1)
    80003150:	ffffe097          	auipc	ra,0xffffe
    80003154:	548080e7          	jalr	1352(ra) # 80001698 <_Z10sem_signalP9semaphore>
}
    80003158:	01813083          	ld	ra,24(sp)
    8000315c:	01013403          	ld	s0,16(sp)
    80003160:	00813483          	ld	s1,8(sp)
    80003164:	00013903          	ld	s2,0(sp)
    80003168:	02010113          	addi	sp,sp,32
    8000316c:	00008067          	ret

0000000080003170 <_ZL8producerPv>:

static void producer(void *arg) {
    80003170:	fe010113          	addi	sp,sp,-32
    80003174:	00113c23          	sd	ra,24(sp)
    80003178:	00813823          	sd	s0,16(sp)
    8000317c:	00913423          	sd	s1,8(sp)
    80003180:	01213023          	sd	s2,0(sp)
    80003184:	02010413          	addi	s0,sp,32
    80003188:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000318c:	00000913          	li	s2,0
    80003190:	00c0006f          	j	8000319c <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003194:	ffffe097          	auipc	ra,0xffffe
    80003198:	378080e7          	jalr	888(ra) # 8000150c <_Z15thread_dispatchv>
    while (!threadEnd) {
    8000319c:	00008797          	auipc	a5,0x8
    800031a0:	6c47a783          	lw	a5,1732(a5) # 8000b860 <_ZL9threadEnd>
    800031a4:	02079e63          	bnez	a5,800031e0 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    800031a8:	0004a583          	lw	a1,0(s1)
    800031ac:	0305859b          	addiw	a1,a1,48
    800031b0:	0084b503          	ld	a0,8(s1)
    800031b4:	00003097          	auipc	ra,0x3
    800031b8:	350080e7          	jalr	848(ra) # 80006504 <_ZN6Buffer3putEi>
        i++;
    800031bc:	0019071b          	addiw	a4,s2,1
    800031c0:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800031c4:	0004a683          	lw	a3,0(s1)
    800031c8:	0026979b          	slliw	a5,a3,0x2
    800031cc:	00d787bb          	addw	a5,a5,a3
    800031d0:	0017979b          	slliw	a5,a5,0x1
    800031d4:	02f767bb          	remw	a5,a4,a5
    800031d8:	fc0792e3          	bnez	a5,8000319c <_ZL8producerPv+0x2c>
    800031dc:	fb9ff06f          	j	80003194 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    800031e0:	0104b503          	ld	a0,16(s1)
    800031e4:	ffffe097          	auipc	ra,0xffffe
    800031e8:	4b4080e7          	jalr	1204(ra) # 80001698 <_Z10sem_signalP9semaphore>
}
    800031ec:	01813083          	ld	ra,24(sp)
    800031f0:	01013403          	ld	s0,16(sp)
    800031f4:	00813483          	ld	s1,8(sp)
    800031f8:	00013903          	ld	s2,0(sp)
    800031fc:	02010113          	addi	sp,sp,32
    80003200:	00008067          	ret

0000000080003204 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80003204:	fd010113          	addi	sp,sp,-48
    80003208:	02113423          	sd	ra,40(sp)
    8000320c:	02813023          	sd	s0,32(sp)
    80003210:	00913c23          	sd	s1,24(sp)
    80003214:	01213823          	sd	s2,16(sp)
    80003218:	01313423          	sd	s3,8(sp)
    8000321c:	03010413          	addi	s0,sp,48
    80003220:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003224:	00000993          	li	s3,0
    80003228:	01c0006f          	j	80003244 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    8000322c:	ffffe097          	auipc	ra,0xffffe
    80003230:	2e0080e7          	jalr	736(ra) # 8000150c <_Z15thread_dispatchv>
    80003234:	0500006f          	j	80003284 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003238:	00a00513          	li	a0,10
    8000323c:	ffffe097          	auipc	ra,0xffffe
    80003240:	4e4080e7          	jalr	1252(ra) # 80001720 <_Z4putcc>
    while (!threadEnd) {
    80003244:	00008797          	auipc	a5,0x8
    80003248:	61c7a783          	lw	a5,1564(a5) # 8000b860 <_ZL9threadEnd>
    8000324c:	06079063          	bnez	a5,800032ac <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80003250:	00893503          	ld	a0,8(s2)
    80003254:	00003097          	auipc	ra,0x3
    80003258:	340080e7          	jalr	832(ra) # 80006594 <_ZN6Buffer3getEv>
        i++;
    8000325c:	0019849b          	addiw	s1,s3,1
    80003260:	0004899b          	sext.w	s3,s1
        putc(key);
    80003264:	0ff57513          	andi	a0,a0,255
    80003268:	ffffe097          	auipc	ra,0xffffe
    8000326c:	4b8080e7          	jalr	1208(ra) # 80001720 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003270:	00092703          	lw	a4,0(s2)
    80003274:	0027179b          	slliw	a5,a4,0x2
    80003278:	00e787bb          	addw	a5,a5,a4
    8000327c:	02f4e7bb          	remw	a5,s1,a5
    80003280:	fa0786e3          	beqz	a5,8000322c <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80003284:	05000793          	li	a5,80
    80003288:	02f4e4bb          	remw	s1,s1,a5
    8000328c:	fa049ce3          	bnez	s1,80003244 <_ZL8consumerPv+0x40>
    80003290:	fa9ff06f          	j	80003238 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80003294:	00893503          	ld	a0,8(s2)
    80003298:	00003097          	auipc	ra,0x3
    8000329c:	2fc080e7          	jalr	764(ra) # 80006594 <_ZN6Buffer3getEv>
        putc(key);
    800032a0:	0ff57513          	andi	a0,a0,255
    800032a4:	ffffe097          	auipc	ra,0xffffe
    800032a8:	47c080e7          	jalr	1148(ra) # 80001720 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    800032ac:	00893503          	ld	a0,8(s2)
    800032b0:	00003097          	auipc	ra,0x3
    800032b4:	370080e7          	jalr	880(ra) # 80006620 <_ZN6Buffer6getCntEv>
    800032b8:	fca04ee3          	bgtz	a0,80003294 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    800032bc:	01093503          	ld	a0,16(s2)
    800032c0:	ffffe097          	auipc	ra,0xffffe
    800032c4:	3d8080e7          	jalr	984(ra) # 80001698 <_Z10sem_signalP9semaphore>
}
    800032c8:	02813083          	ld	ra,40(sp)
    800032cc:	02013403          	ld	s0,32(sp)
    800032d0:	01813483          	ld	s1,24(sp)
    800032d4:	01013903          	ld	s2,16(sp)
    800032d8:	00813983          	ld	s3,8(sp)
    800032dc:	03010113          	addi	sp,sp,48
    800032e0:	00008067          	ret

00000000800032e4 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    800032e4:	f9010113          	addi	sp,sp,-112
    800032e8:	06113423          	sd	ra,104(sp)
    800032ec:	06813023          	sd	s0,96(sp)
    800032f0:	04913c23          	sd	s1,88(sp)
    800032f4:	05213823          	sd	s2,80(sp)
    800032f8:	05313423          	sd	s3,72(sp)
    800032fc:	05413023          	sd	s4,64(sp)
    80003300:	03513c23          	sd	s5,56(sp)
    80003304:	03613823          	sd	s6,48(sp)
    80003308:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    8000330c:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80003310:	00006517          	auipc	a0,0x6
    80003314:	d1050513          	addi	a0,a0,-752 # 80009020 <CONSOLE_STATUS+0x10>
    80003318:	00002097          	auipc	ra,0x2
    8000331c:	220080e7          	jalr	544(ra) # 80005538 <_Z11printStringPKc>
    getString(input, 30);
    80003320:	01e00593          	li	a1,30
    80003324:	fa040493          	addi	s1,s0,-96
    80003328:	00048513          	mv	a0,s1
    8000332c:	00002097          	auipc	ra,0x2
    80003330:	294080e7          	jalr	660(ra) # 800055c0 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003334:	00048513          	mv	a0,s1
    80003338:	00002097          	auipc	ra,0x2
    8000333c:	360080e7          	jalr	864(ra) # 80005698 <_Z11stringToIntPKc>
    80003340:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80003344:	00006517          	auipc	a0,0x6
    80003348:	cfc50513          	addi	a0,a0,-772 # 80009040 <CONSOLE_STATUS+0x30>
    8000334c:	00002097          	auipc	ra,0x2
    80003350:	1ec080e7          	jalr	492(ra) # 80005538 <_Z11printStringPKc>
    getString(input, 30);
    80003354:	01e00593          	li	a1,30
    80003358:	00048513          	mv	a0,s1
    8000335c:	00002097          	auipc	ra,0x2
    80003360:	264080e7          	jalr	612(ra) # 800055c0 <_Z9getStringPci>
    n = stringToInt(input);
    80003364:	00048513          	mv	a0,s1
    80003368:	00002097          	auipc	ra,0x2
    8000336c:	330080e7          	jalr	816(ra) # 80005698 <_Z11stringToIntPKc>
    80003370:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80003374:	00006517          	auipc	a0,0x6
    80003378:	cec50513          	addi	a0,a0,-788 # 80009060 <CONSOLE_STATUS+0x50>
    8000337c:	00002097          	auipc	ra,0x2
    80003380:	1bc080e7          	jalr	444(ra) # 80005538 <_Z11printStringPKc>
    80003384:	00000613          	li	a2,0
    80003388:	00a00593          	li	a1,10
    8000338c:	00090513          	mv	a0,s2
    80003390:	00002097          	auipc	ra,0x2
    80003394:	358080e7          	jalr	856(ra) # 800056e8 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80003398:	00006517          	auipc	a0,0x6
    8000339c:	ce050513          	addi	a0,a0,-800 # 80009078 <CONSOLE_STATUS+0x68>
    800033a0:	00002097          	auipc	ra,0x2
    800033a4:	198080e7          	jalr	408(ra) # 80005538 <_Z11printStringPKc>
    800033a8:	00000613          	li	a2,0
    800033ac:	00a00593          	li	a1,10
    800033b0:	00048513          	mv	a0,s1
    800033b4:	00002097          	auipc	ra,0x2
    800033b8:	334080e7          	jalr	820(ra) # 800056e8 <_Z8printIntiii>
    printString(".\n");
    800033bc:	00006517          	auipc	a0,0x6
    800033c0:	cd450513          	addi	a0,a0,-812 # 80009090 <CONSOLE_STATUS+0x80>
    800033c4:	00002097          	auipc	ra,0x2
    800033c8:	174080e7          	jalr	372(ra) # 80005538 <_Z11printStringPKc>
    if(threadNum > n) {
    800033cc:	0324c463          	blt	s1,s2,800033f4 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    800033d0:	03205c63          	blez	s2,80003408 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    800033d4:	03800513          	li	a0,56
    800033d8:	fffff097          	auipc	ra,0xfffff
    800033dc:	eb4080e7          	jalr	-332(ra) # 8000228c <_Znwm>
    800033e0:	00050a13          	mv	s4,a0
    800033e4:	00048593          	mv	a1,s1
    800033e8:	00003097          	auipc	ra,0x3
    800033ec:	080080e7          	jalr	128(ra) # 80006468 <_ZN6BufferC1Ei>
    800033f0:	0300006f          	j	80003420 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800033f4:	00006517          	auipc	a0,0x6
    800033f8:	ca450513          	addi	a0,a0,-860 # 80009098 <CONSOLE_STATUS+0x88>
    800033fc:	00002097          	auipc	ra,0x2
    80003400:	13c080e7          	jalr	316(ra) # 80005538 <_Z11printStringPKc>
        return;
    80003404:	0140006f          	j	80003418 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003408:	00006517          	auipc	a0,0x6
    8000340c:	cd050513          	addi	a0,a0,-816 # 800090d8 <CONSOLE_STATUS+0xc8>
    80003410:	00002097          	auipc	ra,0x2
    80003414:	128080e7          	jalr	296(ra) # 80005538 <_Z11printStringPKc>
        return;
    80003418:	000b0113          	mv	sp,s6
    8000341c:	1500006f          	j	8000356c <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80003420:	00000593          	li	a1,0
    80003424:	00008517          	auipc	a0,0x8
    80003428:	44450513          	addi	a0,a0,1092 # 8000b868 <_ZL10waitForAll>
    8000342c:	ffffe097          	auipc	ra,0xffffe
    80003430:	178080e7          	jalr	376(ra) # 800015a4 <_Z8sem_openPP9semaphorej>
    thread_t threads[threadNum];
    80003434:	00391793          	slli	a5,s2,0x3
    80003438:	00f78793          	addi	a5,a5,15
    8000343c:	ff07f793          	andi	a5,a5,-16
    80003440:	40f10133          	sub	sp,sp,a5
    80003444:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80003448:	0019071b          	addiw	a4,s2,1
    8000344c:	00171793          	slli	a5,a4,0x1
    80003450:	00e787b3          	add	a5,a5,a4
    80003454:	00379793          	slli	a5,a5,0x3
    80003458:	00f78793          	addi	a5,a5,15
    8000345c:	ff07f793          	andi	a5,a5,-16
    80003460:	40f10133          	sub	sp,sp,a5
    80003464:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80003468:	00191613          	slli	a2,s2,0x1
    8000346c:	012607b3          	add	a5,a2,s2
    80003470:	00379793          	slli	a5,a5,0x3
    80003474:	00f987b3          	add	a5,s3,a5
    80003478:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    8000347c:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003480:	00008717          	auipc	a4,0x8
    80003484:	3e873703          	ld	a4,1000(a4) # 8000b868 <_ZL10waitForAll>
    80003488:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    8000348c:	00078613          	mv	a2,a5
    80003490:	00000597          	auipc	a1,0x0
    80003494:	d7458593          	addi	a1,a1,-652 # 80003204 <_ZL8consumerPv>
    80003498:	f9840513          	addi	a0,s0,-104
    8000349c:	ffffe097          	auipc	ra,0xffffe
    800034a0:	f8c080e7          	jalr	-116(ra) # 80001428 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800034a4:	00000493          	li	s1,0
    800034a8:	0280006f          	j	800034d0 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    800034ac:	00000597          	auipc	a1,0x0
    800034b0:	c1458593          	addi	a1,a1,-1004 # 800030c0 <_ZL16producerKeyboardPv>
                      data + i);
    800034b4:	00179613          	slli	a2,a5,0x1
    800034b8:	00f60633          	add	a2,a2,a5
    800034bc:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    800034c0:	00c98633          	add	a2,s3,a2
    800034c4:	ffffe097          	auipc	ra,0xffffe
    800034c8:	f64080e7          	jalr	-156(ra) # 80001428 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800034cc:	0014849b          	addiw	s1,s1,1
    800034d0:	0524d263          	bge	s1,s2,80003514 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    800034d4:	00149793          	slli	a5,s1,0x1
    800034d8:	009787b3          	add	a5,a5,s1
    800034dc:	00379793          	slli	a5,a5,0x3
    800034e0:	00f987b3          	add	a5,s3,a5
    800034e4:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800034e8:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    800034ec:	00008717          	auipc	a4,0x8
    800034f0:	37c73703          	ld	a4,892(a4) # 8000b868 <_ZL10waitForAll>
    800034f4:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    800034f8:	00048793          	mv	a5,s1
    800034fc:	00349513          	slli	a0,s1,0x3
    80003500:	00aa8533          	add	a0,s5,a0
    80003504:	fa9054e3          	blez	s1,800034ac <_Z22producerConsumer_C_APIv+0x1c8>
    80003508:	00000597          	auipc	a1,0x0
    8000350c:	c6858593          	addi	a1,a1,-920 # 80003170 <_ZL8producerPv>
    80003510:	fa5ff06f          	j	800034b4 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80003514:	ffffe097          	auipc	ra,0xffffe
    80003518:	ff8080e7          	jalr	-8(ra) # 8000150c <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    8000351c:	00000493          	li	s1,0
    80003520:	00994e63          	blt	s2,s1,8000353c <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80003524:	00008517          	auipc	a0,0x8
    80003528:	34453503          	ld	a0,836(a0) # 8000b868 <_ZL10waitForAll>
    8000352c:	ffffe097          	auipc	ra,0xffffe
    80003530:	120080e7          	jalr	288(ra) # 8000164c <_Z8sem_waitP9semaphore>
    for (int i = 0; i <= threadNum; i++) {
    80003534:	0014849b          	addiw	s1,s1,1
    80003538:	fe9ff06f          	j	80003520 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    8000353c:	00008517          	auipc	a0,0x8
    80003540:	32c53503          	ld	a0,812(a0) # 8000b868 <_ZL10waitForAll>
    80003544:	ffffe097          	auipc	ra,0xffffe
    80003548:	0bc080e7          	jalr	188(ra) # 80001600 <_Z9sem_closeP9semaphore>
    delete buffer;
    8000354c:	000a0e63          	beqz	s4,80003568 <_Z22producerConsumer_C_APIv+0x284>
    80003550:	000a0513          	mv	a0,s4
    80003554:	00003097          	auipc	ra,0x3
    80003558:	154080e7          	jalr	340(ra) # 800066a8 <_ZN6BufferD1Ev>
    8000355c:	000a0513          	mv	a0,s4
    80003560:	fffff097          	auipc	ra,0xfffff
    80003564:	d54080e7          	jalr	-684(ra) # 800022b4 <_ZdlPv>
    80003568:	000b0113          	mv	sp,s6

}
    8000356c:	f9040113          	addi	sp,s0,-112
    80003570:	06813083          	ld	ra,104(sp)
    80003574:	06013403          	ld	s0,96(sp)
    80003578:	05813483          	ld	s1,88(sp)
    8000357c:	05013903          	ld	s2,80(sp)
    80003580:	04813983          	ld	s3,72(sp)
    80003584:	04013a03          	ld	s4,64(sp)
    80003588:	03813a83          	ld	s5,56(sp)
    8000358c:	03013b03          	ld	s6,48(sp)
    80003590:	07010113          	addi	sp,sp,112
    80003594:	00008067          	ret
    80003598:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    8000359c:	000a0513          	mv	a0,s4
    800035a0:	fffff097          	auipc	ra,0xfffff
    800035a4:	d14080e7          	jalr	-748(ra) # 800022b4 <_ZdlPv>
    800035a8:	00048513          	mv	a0,s1
    800035ac:	00009097          	auipc	ra,0x9
    800035b0:	3cc080e7          	jalr	972(ra) # 8000c978 <_Unwind_Resume>

00000000800035b4 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800035b4:	fe010113          	addi	sp,sp,-32
    800035b8:	00113c23          	sd	ra,24(sp)
    800035bc:	00813823          	sd	s0,16(sp)
    800035c0:	00913423          	sd	s1,8(sp)
    800035c4:	01213023          	sd	s2,0(sp)
    800035c8:	02010413          	addi	s0,sp,32
    800035cc:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800035d0:	00100793          	li	a5,1
    800035d4:	02a7f863          	bgeu	a5,a0,80003604 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800035d8:	00a00793          	li	a5,10
    800035dc:	02f577b3          	remu	a5,a0,a5
    800035e0:	02078e63          	beqz	a5,8000361c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800035e4:	fff48513          	addi	a0,s1,-1
    800035e8:	00000097          	auipc	ra,0x0
    800035ec:	fcc080e7          	jalr	-52(ra) # 800035b4 <_ZL9fibonaccim>
    800035f0:	00050913          	mv	s2,a0
    800035f4:	ffe48513          	addi	a0,s1,-2
    800035f8:	00000097          	auipc	ra,0x0
    800035fc:	fbc080e7          	jalr	-68(ra) # 800035b4 <_ZL9fibonaccim>
    80003600:	00a90533          	add	a0,s2,a0
}
    80003604:	01813083          	ld	ra,24(sp)
    80003608:	01013403          	ld	s0,16(sp)
    8000360c:	00813483          	ld	s1,8(sp)
    80003610:	00013903          	ld	s2,0(sp)
    80003614:	02010113          	addi	sp,sp,32
    80003618:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    8000361c:	ffffe097          	auipc	ra,0xffffe
    80003620:	ef0080e7          	jalr	-272(ra) # 8000150c <_Z15thread_dispatchv>
    80003624:	fc1ff06f          	j	800035e4 <_ZL9fibonaccim+0x30>

0000000080003628 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80003628:	fe010113          	addi	sp,sp,-32
    8000362c:	00113c23          	sd	ra,24(sp)
    80003630:	00813823          	sd	s0,16(sp)
    80003634:	00913423          	sd	s1,8(sp)
    80003638:	01213023          	sd	s2,0(sp)
    8000363c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003640:	00000913          	li	s2,0
    80003644:	0380006f          	j	8000367c <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003648:	ffffe097          	auipc	ra,0xffffe
    8000364c:	ec4080e7          	jalr	-316(ra) # 8000150c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003650:	00148493          	addi	s1,s1,1
    80003654:	000027b7          	lui	a5,0x2
    80003658:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000365c:	0097ee63          	bltu	a5,s1,80003678 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003660:	00000713          	li	a4,0
    80003664:	000077b7          	lui	a5,0x7
    80003668:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000366c:	fce7eee3          	bltu	a5,a4,80003648 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003670:	00170713          	addi	a4,a4,1
    80003674:	ff1ff06f          	j	80003664 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003678:	00190913          	addi	s2,s2,1
    8000367c:	00900793          	li	a5,9
    80003680:	0527e063          	bltu	a5,s2,800036c0 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003684:	00006517          	auipc	a0,0x6
    80003688:	a8450513          	addi	a0,a0,-1404 # 80009108 <CONSOLE_STATUS+0xf8>
    8000368c:	00002097          	auipc	ra,0x2
    80003690:	eac080e7          	jalr	-340(ra) # 80005538 <_Z11printStringPKc>
    80003694:	00000613          	li	a2,0
    80003698:	00a00593          	li	a1,10
    8000369c:	0009051b          	sext.w	a0,s2
    800036a0:	00002097          	auipc	ra,0x2
    800036a4:	048080e7          	jalr	72(ra) # 800056e8 <_Z8printIntiii>
    800036a8:	00006517          	auipc	a0,0x6
    800036ac:	cb050513          	addi	a0,a0,-848 # 80009358 <CONSOLE_STATUS+0x348>
    800036b0:	00002097          	auipc	ra,0x2
    800036b4:	e88080e7          	jalr	-376(ra) # 80005538 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800036b8:	00000493          	li	s1,0
    800036bc:	f99ff06f          	j	80003654 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    800036c0:	00006517          	auipc	a0,0x6
    800036c4:	a5050513          	addi	a0,a0,-1456 # 80009110 <CONSOLE_STATUS+0x100>
    800036c8:	00002097          	auipc	ra,0x2
    800036cc:	e70080e7          	jalr	-400(ra) # 80005538 <_Z11printStringPKc>
    finishedA = true;
    800036d0:	00100793          	li	a5,1
    800036d4:	00008717          	auipc	a4,0x8
    800036d8:	18f70e23          	sb	a5,412(a4) # 8000b870 <_ZL9finishedA>
}
    800036dc:	01813083          	ld	ra,24(sp)
    800036e0:	01013403          	ld	s0,16(sp)
    800036e4:	00813483          	ld	s1,8(sp)
    800036e8:	00013903          	ld	s2,0(sp)
    800036ec:	02010113          	addi	sp,sp,32
    800036f0:	00008067          	ret

00000000800036f4 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    800036f4:	fe010113          	addi	sp,sp,-32
    800036f8:	00113c23          	sd	ra,24(sp)
    800036fc:	00813823          	sd	s0,16(sp)
    80003700:	00913423          	sd	s1,8(sp)
    80003704:	01213023          	sd	s2,0(sp)
    80003708:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    8000370c:	00000913          	li	s2,0
    80003710:	0380006f          	j	80003748 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003714:	ffffe097          	auipc	ra,0xffffe
    80003718:	df8080e7          	jalr	-520(ra) # 8000150c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000371c:	00148493          	addi	s1,s1,1
    80003720:	000027b7          	lui	a5,0x2
    80003724:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003728:	0097ee63          	bltu	a5,s1,80003744 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000372c:	00000713          	li	a4,0
    80003730:	000077b7          	lui	a5,0x7
    80003734:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003738:	fce7eee3          	bltu	a5,a4,80003714 <_ZN7WorkerB11workerBodyBEPv+0x20>
    8000373c:	00170713          	addi	a4,a4,1
    80003740:	ff1ff06f          	j	80003730 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003744:	00190913          	addi	s2,s2,1
    80003748:	00f00793          	li	a5,15
    8000374c:	0527e063          	bltu	a5,s2,8000378c <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003750:	00006517          	auipc	a0,0x6
    80003754:	9d050513          	addi	a0,a0,-1584 # 80009120 <CONSOLE_STATUS+0x110>
    80003758:	00002097          	auipc	ra,0x2
    8000375c:	de0080e7          	jalr	-544(ra) # 80005538 <_Z11printStringPKc>
    80003760:	00000613          	li	a2,0
    80003764:	00a00593          	li	a1,10
    80003768:	0009051b          	sext.w	a0,s2
    8000376c:	00002097          	auipc	ra,0x2
    80003770:	f7c080e7          	jalr	-132(ra) # 800056e8 <_Z8printIntiii>
    80003774:	00006517          	auipc	a0,0x6
    80003778:	be450513          	addi	a0,a0,-1052 # 80009358 <CONSOLE_STATUS+0x348>
    8000377c:	00002097          	auipc	ra,0x2
    80003780:	dbc080e7          	jalr	-580(ra) # 80005538 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003784:	00000493          	li	s1,0
    80003788:	f99ff06f          	j	80003720 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    8000378c:	00006517          	auipc	a0,0x6
    80003790:	99c50513          	addi	a0,a0,-1636 # 80009128 <CONSOLE_STATUS+0x118>
    80003794:	00002097          	auipc	ra,0x2
    80003798:	da4080e7          	jalr	-604(ra) # 80005538 <_Z11printStringPKc>
    finishedB = true;
    8000379c:	00100793          	li	a5,1
    800037a0:	00008717          	auipc	a4,0x8
    800037a4:	0cf708a3          	sb	a5,209(a4) # 8000b871 <_ZL9finishedB>
    thread_dispatch();
    800037a8:	ffffe097          	auipc	ra,0xffffe
    800037ac:	d64080e7          	jalr	-668(ra) # 8000150c <_Z15thread_dispatchv>
}
    800037b0:	01813083          	ld	ra,24(sp)
    800037b4:	01013403          	ld	s0,16(sp)
    800037b8:	00813483          	ld	s1,8(sp)
    800037bc:	00013903          	ld	s2,0(sp)
    800037c0:	02010113          	addi	sp,sp,32
    800037c4:	00008067          	ret

00000000800037c8 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    800037c8:	fe010113          	addi	sp,sp,-32
    800037cc:	00113c23          	sd	ra,24(sp)
    800037d0:	00813823          	sd	s0,16(sp)
    800037d4:	00913423          	sd	s1,8(sp)
    800037d8:	01213023          	sd	s2,0(sp)
    800037dc:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800037e0:	00000493          	li	s1,0
    800037e4:	0400006f          	j	80003824 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    800037e8:	00006517          	auipc	a0,0x6
    800037ec:	95050513          	addi	a0,a0,-1712 # 80009138 <CONSOLE_STATUS+0x128>
    800037f0:	00002097          	auipc	ra,0x2
    800037f4:	d48080e7          	jalr	-696(ra) # 80005538 <_Z11printStringPKc>
    800037f8:	00000613          	li	a2,0
    800037fc:	00a00593          	li	a1,10
    80003800:	00048513          	mv	a0,s1
    80003804:	00002097          	auipc	ra,0x2
    80003808:	ee4080e7          	jalr	-284(ra) # 800056e8 <_Z8printIntiii>
    8000380c:	00006517          	auipc	a0,0x6
    80003810:	b4c50513          	addi	a0,a0,-1204 # 80009358 <CONSOLE_STATUS+0x348>
    80003814:	00002097          	auipc	ra,0x2
    80003818:	d24080e7          	jalr	-732(ra) # 80005538 <_Z11printStringPKc>
    for (; i < 3; i++) {
    8000381c:	0014849b          	addiw	s1,s1,1
    80003820:	0ff4f493          	andi	s1,s1,255
    80003824:	00200793          	li	a5,2
    80003828:	fc97f0e3          	bgeu	a5,s1,800037e8 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    8000382c:	00006517          	auipc	a0,0x6
    80003830:	91450513          	addi	a0,a0,-1772 # 80009140 <CONSOLE_STATUS+0x130>
    80003834:	00002097          	auipc	ra,0x2
    80003838:	d04080e7          	jalr	-764(ra) # 80005538 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    8000383c:	00700313          	li	t1,7
    thread_dispatch();
    80003840:	ffffe097          	auipc	ra,0xffffe
    80003844:	ccc080e7          	jalr	-820(ra) # 8000150c <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003848:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    8000384c:	00006517          	auipc	a0,0x6
    80003850:	90450513          	addi	a0,a0,-1788 # 80009150 <CONSOLE_STATUS+0x140>
    80003854:	00002097          	auipc	ra,0x2
    80003858:	ce4080e7          	jalr	-796(ra) # 80005538 <_Z11printStringPKc>
    8000385c:	00000613          	li	a2,0
    80003860:	00a00593          	li	a1,10
    80003864:	0009051b          	sext.w	a0,s2
    80003868:	00002097          	auipc	ra,0x2
    8000386c:	e80080e7          	jalr	-384(ra) # 800056e8 <_Z8printIntiii>
    80003870:	00006517          	auipc	a0,0x6
    80003874:	ae850513          	addi	a0,a0,-1304 # 80009358 <CONSOLE_STATUS+0x348>
    80003878:	00002097          	auipc	ra,0x2
    8000387c:	cc0080e7          	jalr	-832(ra) # 80005538 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80003880:	00c00513          	li	a0,12
    80003884:	00000097          	auipc	ra,0x0
    80003888:	d30080e7          	jalr	-720(ra) # 800035b4 <_ZL9fibonaccim>
    8000388c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003890:	00006517          	auipc	a0,0x6
    80003894:	8c850513          	addi	a0,a0,-1848 # 80009158 <CONSOLE_STATUS+0x148>
    80003898:	00002097          	auipc	ra,0x2
    8000389c:	ca0080e7          	jalr	-864(ra) # 80005538 <_Z11printStringPKc>
    800038a0:	00000613          	li	a2,0
    800038a4:	00a00593          	li	a1,10
    800038a8:	0009051b          	sext.w	a0,s2
    800038ac:	00002097          	auipc	ra,0x2
    800038b0:	e3c080e7          	jalr	-452(ra) # 800056e8 <_Z8printIntiii>
    800038b4:	00006517          	auipc	a0,0x6
    800038b8:	aa450513          	addi	a0,a0,-1372 # 80009358 <CONSOLE_STATUS+0x348>
    800038bc:	00002097          	auipc	ra,0x2
    800038c0:	c7c080e7          	jalr	-900(ra) # 80005538 <_Z11printStringPKc>
    800038c4:	0400006f          	j	80003904 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    800038c8:	00006517          	auipc	a0,0x6
    800038cc:	87050513          	addi	a0,a0,-1936 # 80009138 <CONSOLE_STATUS+0x128>
    800038d0:	00002097          	auipc	ra,0x2
    800038d4:	c68080e7          	jalr	-920(ra) # 80005538 <_Z11printStringPKc>
    800038d8:	00000613          	li	a2,0
    800038dc:	00a00593          	li	a1,10
    800038e0:	00048513          	mv	a0,s1
    800038e4:	00002097          	auipc	ra,0x2
    800038e8:	e04080e7          	jalr	-508(ra) # 800056e8 <_Z8printIntiii>
    800038ec:	00006517          	auipc	a0,0x6
    800038f0:	a6c50513          	addi	a0,a0,-1428 # 80009358 <CONSOLE_STATUS+0x348>
    800038f4:	00002097          	auipc	ra,0x2
    800038f8:	c44080e7          	jalr	-956(ra) # 80005538 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800038fc:	0014849b          	addiw	s1,s1,1
    80003900:	0ff4f493          	andi	s1,s1,255
    80003904:	00500793          	li	a5,5
    80003908:	fc97f0e3          	bgeu	a5,s1,800038c8 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    8000390c:	00006517          	auipc	a0,0x6
    80003910:	80450513          	addi	a0,a0,-2044 # 80009110 <CONSOLE_STATUS+0x100>
    80003914:	00002097          	auipc	ra,0x2
    80003918:	c24080e7          	jalr	-988(ra) # 80005538 <_Z11printStringPKc>
    finishedC = true;
    8000391c:	00100793          	li	a5,1
    80003920:	00008717          	auipc	a4,0x8
    80003924:	f4f70923          	sb	a5,-174(a4) # 8000b872 <_ZL9finishedC>
    thread_dispatch();
    80003928:	ffffe097          	auipc	ra,0xffffe
    8000392c:	be4080e7          	jalr	-1052(ra) # 8000150c <_Z15thread_dispatchv>
}
    80003930:	01813083          	ld	ra,24(sp)
    80003934:	01013403          	ld	s0,16(sp)
    80003938:	00813483          	ld	s1,8(sp)
    8000393c:	00013903          	ld	s2,0(sp)
    80003940:	02010113          	addi	sp,sp,32
    80003944:	00008067          	ret

0000000080003948 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80003948:	fe010113          	addi	sp,sp,-32
    8000394c:	00113c23          	sd	ra,24(sp)
    80003950:	00813823          	sd	s0,16(sp)
    80003954:	00913423          	sd	s1,8(sp)
    80003958:	01213023          	sd	s2,0(sp)
    8000395c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003960:	00a00493          	li	s1,10
    80003964:	0400006f          	j	800039a4 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003968:	00006517          	auipc	a0,0x6
    8000396c:	80050513          	addi	a0,a0,-2048 # 80009168 <CONSOLE_STATUS+0x158>
    80003970:	00002097          	auipc	ra,0x2
    80003974:	bc8080e7          	jalr	-1080(ra) # 80005538 <_Z11printStringPKc>
    80003978:	00000613          	li	a2,0
    8000397c:	00a00593          	li	a1,10
    80003980:	00048513          	mv	a0,s1
    80003984:	00002097          	auipc	ra,0x2
    80003988:	d64080e7          	jalr	-668(ra) # 800056e8 <_Z8printIntiii>
    8000398c:	00006517          	auipc	a0,0x6
    80003990:	9cc50513          	addi	a0,a0,-1588 # 80009358 <CONSOLE_STATUS+0x348>
    80003994:	00002097          	auipc	ra,0x2
    80003998:	ba4080e7          	jalr	-1116(ra) # 80005538 <_Z11printStringPKc>
    for (; i < 13; i++) {
    8000399c:	0014849b          	addiw	s1,s1,1
    800039a0:	0ff4f493          	andi	s1,s1,255
    800039a4:	00c00793          	li	a5,12
    800039a8:	fc97f0e3          	bgeu	a5,s1,80003968 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    800039ac:	00005517          	auipc	a0,0x5
    800039b0:	7c450513          	addi	a0,a0,1988 # 80009170 <CONSOLE_STATUS+0x160>
    800039b4:	00002097          	auipc	ra,0x2
    800039b8:	b84080e7          	jalr	-1148(ra) # 80005538 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800039bc:	00500313          	li	t1,5
    thread_dispatch();
    800039c0:	ffffe097          	auipc	ra,0xffffe
    800039c4:	b4c080e7          	jalr	-1204(ra) # 8000150c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800039c8:	01000513          	li	a0,16
    800039cc:	00000097          	auipc	ra,0x0
    800039d0:	be8080e7          	jalr	-1048(ra) # 800035b4 <_ZL9fibonaccim>
    800039d4:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800039d8:	00005517          	auipc	a0,0x5
    800039dc:	7a850513          	addi	a0,a0,1960 # 80009180 <CONSOLE_STATUS+0x170>
    800039e0:	00002097          	auipc	ra,0x2
    800039e4:	b58080e7          	jalr	-1192(ra) # 80005538 <_Z11printStringPKc>
    800039e8:	00000613          	li	a2,0
    800039ec:	00a00593          	li	a1,10
    800039f0:	0009051b          	sext.w	a0,s2
    800039f4:	00002097          	auipc	ra,0x2
    800039f8:	cf4080e7          	jalr	-780(ra) # 800056e8 <_Z8printIntiii>
    800039fc:	00006517          	auipc	a0,0x6
    80003a00:	95c50513          	addi	a0,a0,-1700 # 80009358 <CONSOLE_STATUS+0x348>
    80003a04:	00002097          	auipc	ra,0x2
    80003a08:	b34080e7          	jalr	-1228(ra) # 80005538 <_Z11printStringPKc>
    80003a0c:	0400006f          	j	80003a4c <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003a10:	00005517          	auipc	a0,0x5
    80003a14:	75850513          	addi	a0,a0,1880 # 80009168 <CONSOLE_STATUS+0x158>
    80003a18:	00002097          	auipc	ra,0x2
    80003a1c:	b20080e7          	jalr	-1248(ra) # 80005538 <_Z11printStringPKc>
    80003a20:	00000613          	li	a2,0
    80003a24:	00a00593          	li	a1,10
    80003a28:	00048513          	mv	a0,s1
    80003a2c:	00002097          	auipc	ra,0x2
    80003a30:	cbc080e7          	jalr	-836(ra) # 800056e8 <_Z8printIntiii>
    80003a34:	00006517          	auipc	a0,0x6
    80003a38:	92450513          	addi	a0,a0,-1756 # 80009358 <CONSOLE_STATUS+0x348>
    80003a3c:	00002097          	auipc	ra,0x2
    80003a40:	afc080e7          	jalr	-1284(ra) # 80005538 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003a44:	0014849b          	addiw	s1,s1,1
    80003a48:	0ff4f493          	andi	s1,s1,255
    80003a4c:	00f00793          	li	a5,15
    80003a50:	fc97f0e3          	bgeu	a5,s1,80003a10 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80003a54:	00005517          	auipc	a0,0x5
    80003a58:	73c50513          	addi	a0,a0,1852 # 80009190 <CONSOLE_STATUS+0x180>
    80003a5c:	00002097          	auipc	ra,0x2
    80003a60:	adc080e7          	jalr	-1316(ra) # 80005538 <_Z11printStringPKc>
    finishedD = true;
    80003a64:	00100793          	li	a5,1
    80003a68:	00008717          	auipc	a4,0x8
    80003a6c:	e0f705a3          	sb	a5,-501(a4) # 8000b873 <_ZL9finishedD>
    thread_dispatch();
    80003a70:	ffffe097          	auipc	ra,0xffffe
    80003a74:	a9c080e7          	jalr	-1380(ra) # 8000150c <_Z15thread_dispatchv>
}
    80003a78:	01813083          	ld	ra,24(sp)
    80003a7c:	01013403          	ld	s0,16(sp)
    80003a80:	00813483          	ld	s1,8(sp)
    80003a84:	00013903          	ld	s2,0(sp)
    80003a88:	02010113          	addi	sp,sp,32
    80003a8c:	00008067          	ret

0000000080003a90 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80003a90:	fc010113          	addi	sp,sp,-64
    80003a94:	02113c23          	sd	ra,56(sp)
    80003a98:	02813823          	sd	s0,48(sp)
    80003a9c:	02913423          	sd	s1,40(sp)
    80003aa0:	03213023          	sd	s2,32(sp)
    80003aa4:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80003aa8:	02000513          	li	a0,32
    80003aac:	ffffe097          	auipc	ra,0xffffe
    80003ab0:	7e0080e7          	jalr	2016(ra) # 8000228c <_Znwm>
    80003ab4:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80003ab8:	fffff097          	auipc	ra,0xfffff
    80003abc:	9dc080e7          	jalr	-1572(ra) # 80002494 <_ZN6ThreadC1Ev>
    80003ac0:	00008797          	auipc	a5,0x8
    80003ac4:	b0078793          	addi	a5,a5,-1280 # 8000b5c0 <_ZTV7WorkerA+0x10>
    80003ac8:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80003acc:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80003ad0:	00005517          	auipc	a0,0x5
    80003ad4:	6d050513          	addi	a0,a0,1744 # 800091a0 <CONSOLE_STATUS+0x190>
    80003ad8:	00002097          	auipc	ra,0x2
    80003adc:	a60080e7          	jalr	-1440(ra) # 80005538 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80003ae0:	02000513          	li	a0,32
    80003ae4:	ffffe097          	auipc	ra,0xffffe
    80003ae8:	7a8080e7          	jalr	1960(ra) # 8000228c <_Znwm>
    80003aec:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80003af0:	fffff097          	auipc	ra,0xfffff
    80003af4:	9a4080e7          	jalr	-1628(ra) # 80002494 <_ZN6ThreadC1Ev>
    80003af8:	00008797          	auipc	a5,0x8
    80003afc:	af078793          	addi	a5,a5,-1296 # 8000b5e8 <_ZTV7WorkerB+0x10>
    80003b00:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80003b04:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80003b08:	00005517          	auipc	a0,0x5
    80003b0c:	6b050513          	addi	a0,a0,1712 # 800091b8 <CONSOLE_STATUS+0x1a8>
    80003b10:	00002097          	auipc	ra,0x2
    80003b14:	a28080e7          	jalr	-1496(ra) # 80005538 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80003b18:	02000513          	li	a0,32
    80003b1c:	ffffe097          	auipc	ra,0xffffe
    80003b20:	770080e7          	jalr	1904(ra) # 8000228c <_Znwm>
    80003b24:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80003b28:	fffff097          	auipc	ra,0xfffff
    80003b2c:	96c080e7          	jalr	-1684(ra) # 80002494 <_ZN6ThreadC1Ev>
    80003b30:	00008797          	auipc	a5,0x8
    80003b34:	ae078793          	addi	a5,a5,-1312 # 8000b610 <_ZTV7WorkerC+0x10>
    80003b38:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80003b3c:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80003b40:	00005517          	auipc	a0,0x5
    80003b44:	69050513          	addi	a0,a0,1680 # 800091d0 <CONSOLE_STATUS+0x1c0>
    80003b48:	00002097          	auipc	ra,0x2
    80003b4c:	9f0080e7          	jalr	-1552(ra) # 80005538 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80003b50:	02000513          	li	a0,32
    80003b54:	ffffe097          	auipc	ra,0xffffe
    80003b58:	738080e7          	jalr	1848(ra) # 8000228c <_Znwm>
    80003b5c:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80003b60:	fffff097          	auipc	ra,0xfffff
    80003b64:	934080e7          	jalr	-1740(ra) # 80002494 <_ZN6ThreadC1Ev>
    80003b68:	00008797          	auipc	a5,0x8
    80003b6c:	ad078793          	addi	a5,a5,-1328 # 8000b638 <_ZTV7WorkerD+0x10>
    80003b70:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80003b74:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80003b78:	00005517          	auipc	a0,0x5
    80003b7c:	67050513          	addi	a0,a0,1648 # 800091e8 <CONSOLE_STATUS+0x1d8>
    80003b80:	00002097          	auipc	ra,0x2
    80003b84:	9b8080e7          	jalr	-1608(ra) # 80005538 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80003b88:	00000493          	li	s1,0
    80003b8c:	00300793          	li	a5,3
    80003b90:	0297c663          	blt	a5,s1,80003bbc <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80003b94:	00349793          	slli	a5,s1,0x3
    80003b98:	fe040713          	addi	a4,s0,-32
    80003b9c:	00f707b3          	add	a5,a4,a5
    80003ba0:	fe07b503          	ld	a0,-32(a5)
    80003ba4:	fffff097          	auipc	ra,0xfffff
    80003ba8:	830080e7          	jalr	-2000(ra) # 800023d4 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80003bac:	0014849b          	addiw	s1,s1,1
    80003bb0:	fddff06f          	j	80003b8c <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80003bb4:	fffff097          	auipc	ra,0xfffff
    80003bb8:	890080e7          	jalr	-1904(ra) # 80002444 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80003bbc:	00008797          	auipc	a5,0x8
    80003bc0:	cb47c783          	lbu	a5,-844(a5) # 8000b870 <_ZL9finishedA>
    80003bc4:	fe0788e3          	beqz	a5,80003bb4 <_Z20Threads_CPP_API_testv+0x124>
    80003bc8:	00008797          	auipc	a5,0x8
    80003bcc:	ca97c783          	lbu	a5,-855(a5) # 8000b871 <_ZL9finishedB>
    80003bd0:	fe0782e3          	beqz	a5,80003bb4 <_Z20Threads_CPP_API_testv+0x124>
    80003bd4:	00008797          	auipc	a5,0x8
    80003bd8:	c9e7c783          	lbu	a5,-866(a5) # 8000b872 <_ZL9finishedC>
    80003bdc:	fc078ce3          	beqz	a5,80003bb4 <_Z20Threads_CPP_API_testv+0x124>
    80003be0:	00008797          	auipc	a5,0x8
    80003be4:	c937c783          	lbu	a5,-877(a5) # 8000b873 <_ZL9finishedD>
    80003be8:	fc0786e3          	beqz	a5,80003bb4 <_Z20Threads_CPP_API_testv+0x124>
    80003bec:	fc040493          	addi	s1,s0,-64
    80003bf0:	0080006f          	j	80003bf8 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80003bf4:	00848493          	addi	s1,s1,8
    80003bf8:	fe040793          	addi	a5,s0,-32
    80003bfc:	08f48663          	beq	s1,a5,80003c88 <_Z20Threads_CPP_API_testv+0x1f8>
    80003c00:	0004b503          	ld	a0,0(s1)
    80003c04:	fe0508e3          	beqz	a0,80003bf4 <_Z20Threads_CPP_API_testv+0x164>
    80003c08:	00053783          	ld	a5,0(a0)
    80003c0c:	0087b783          	ld	a5,8(a5)
    80003c10:	000780e7          	jalr	a5
    80003c14:	fe1ff06f          	j	80003bf4 <_Z20Threads_CPP_API_testv+0x164>
    80003c18:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80003c1c:	00048513          	mv	a0,s1
    80003c20:	ffffe097          	auipc	ra,0xffffe
    80003c24:	694080e7          	jalr	1684(ra) # 800022b4 <_ZdlPv>
    80003c28:	00090513          	mv	a0,s2
    80003c2c:	00009097          	auipc	ra,0x9
    80003c30:	d4c080e7          	jalr	-692(ra) # 8000c978 <_Unwind_Resume>
    80003c34:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80003c38:	00048513          	mv	a0,s1
    80003c3c:	ffffe097          	auipc	ra,0xffffe
    80003c40:	678080e7          	jalr	1656(ra) # 800022b4 <_ZdlPv>
    80003c44:	00090513          	mv	a0,s2
    80003c48:	00009097          	auipc	ra,0x9
    80003c4c:	d30080e7          	jalr	-720(ra) # 8000c978 <_Unwind_Resume>
    80003c50:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80003c54:	00048513          	mv	a0,s1
    80003c58:	ffffe097          	auipc	ra,0xffffe
    80003c5c:	65c080e7          	jalr	1628(ra) # 800022b4 <_ZdlPv>
    80003c60:	00090513          	mv	a0,s2
    80003c64:	00009097          	auipc	ra,0x9
    80003c68:	d14080e7          	jalr	-748(ra) # 8000c978 <_Unwind_Resume>
    80003c6c:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80003c70:	00048513          	mv	a0,s1
    80003c74:	ffffe097          	auipc	ra,0xffffe
    80003c78:	640080e7          	jalr	1600(ra) # 800022b4 <_ZdlPv>
    80003c7c:	00090513          	mv	a0,s2
    80003c80:	00009097          	auipc	ra,0x9
    80003c84:	cf8080e7          	jalr	-776(ra) # 8000c978 <_Unwind_Resume>
}
    80003c88:	03813083          	ld	ra,56(sp)
    80003c8c:	03013403          	ld	s0,48(sp)
    80003c90:	02813483          	ld	s1,40(sp)
    80003c94:	02013903          	ld	s2,32(sp)
    80003c98:	04010113          	addi	sp,sp,64
    80003c9c:	00008067          	ret

0000000080003ca0 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80003ca0:	ff010113          	addi	sp,sp,-16
    80003ca4:	00113423          	sd	ra,8(sp)
    80003ca8:	00813023          	sd	s0,0(sp)
    80003cac:	01010413          	addi	s0,sp,16
    80003cb0:	00008797          	auipc	a5,0x8
    80003cb4:	91078793          	addi	a5,a5,-1776 # 8000b5c0 <_ZTV7WorkerA+0x10>
    80003cb8:	00f53023          	sd	a5,0(a0)
    80003cbc:	ffffe097          	auipc	ra,0xffffe
    80003cc0:	620080e7          	jalr	1568(ra) # 800022dc <_ZN6ThreadD1Ev>
    80003cc4:	00813083          	ld	ra,8(sp)
    80003cc8:	00013403          	ld	s0,0(sp)
    80003ccc:	01010113          	addi	sp,sp,16
    80003cd0:	00008067          	ret

0000000080003cd4 <_ZN7WorkerAD0Ev>:
    80003cd4:	fe010113          	addi	sp,sp,-32
    80003cd8:	00113c23          	sd	ra,24(sp)
    80003cdc:	00813823          	sd	s0,16(sp)
    80003ce0:	00913423          	sd	s1,8(sp)
    80003ce4:	02010413          	addi	s0,sp,32
    80003ce8:	00050493          	mv	s1,a0
    80003cec:	00008797          	auipc	a5,0x8
    80003cf0:	8d478793          	addi	a5,a5,-1836 # 8000b5c0 <_ZTV7WorkerA+0x10>
    80003cf4:	00f53023          	sd	a5,0(a0)
    80003cf8:	ffffe097          	auipc	ra,0xffffe
    80003cfc:	5e4080e7          	jalr	1508(ra) # 800022dc <_ZN6ThreadD1Ev>
    80003d00:	00048513          	mv	a0,s1
    80003d04:	ffffe097          	auipc	ra,0xffffe
    80003d08:	5b0080e7          	jalr	1456(ra) # 800022b4 <_ZdlPv>
    80003d0c:	01813083          	ld	ra,24(sp)
    80003d10:	01013403          	ld	s0,16(sp)
    80003d14:	00813483          	ld	s1,8(sp)
    80003d18:	02010113          	addi	sp,sp,32
    80003d1c:	00008067          	ret

0000000080003d20 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80003d20:	ff010113          	addi	sp,sp,-16
    80003d24:	00113423          	sd	ra,8(sp)
    80003d28:	00813023          	sd	s0,0(sp)
    80003d2c:	01010413          	addi	s0,sp,16
    80003d30:	00008797          	auipc	a5,0x8
    80003d34:	8b878793          	addi	a5,a5,-1864 # 8000b5e8 <_ZTV7WorkerB+0x10>
    80003d38:	00f53023          	sd	a5,0(a0)
    80003d3c:	ffffe097          	auipc	ra,0xffffe
    80003d40:	5a0080e7          	jalr	1440(ra) # 800022dc <_ZN6ThreadD1Ev>
    80003d44:	00813083          	ld	ra,8(sp)
    80003d48:	00013403          	ld	s0,0(sp)
    80003d4c:	01010113          	addi	sp,sp,16
    80003d50:	00008067          	ret

0000000080003d54 <_ZN7WorkerBD0Ev>:
    80003d54:	fe010113          	addi	sp,sp,-32
    80003d58:	00113c23          	sd	ra,24(sp)
    80003d5c:	00813823          	sd	s0,16(sp)
    80003d60:	00913423          	sd	s1,8(sp)
    80003d64:	02010413          	addi	s0,sp,32
    80003d68:	00050493          	mv	s1,a0
    80003d6c:	00008797          	auipc	a5,0x8
    80003d70:	87c78793          	addi	a5,a5,-1924 # 8000b5e8 <_ZTV7WorkerB+0x10>
    80003d74:	00f53023          	sd	a5,0(a0)
    80003d78:	ffffe097          	auipc	ra,0xffffe
    80003d7c:	564080e7          	jalr	1380(ra) # 800022dc <_ZN6ThreadD1Ev>
    80003d80:	00048513          	mv	a0,s1
    80003d84:	ffffe097          	auipc	ra,0xffffe
    80003d88:	530080e7          	jalr	1328(ra) # 800022b4 <_ZdlPv>
    80003d8c:	01813083          	ld	ra,24(sp)
    80003d90:	01013403          	ld	s0,16(sp)
    80003d94:	00813483          	ld	s1,8(sp)
    80003d98:	02010113          	addi	sp,sp,32
    80003d9c:	00008067          	ret

0000000080003da0 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80003da0:	ff010113          	addi	sp,sp,-16
    80003da4:	00113423          	sd	ra,8(sp)
    80003da8:	00813023          	sd	s0,0(sp)
    80003dac:	01010413          	addi	s0,sp,16
    80003db0:	00008797          	auipc	a5,0x8
    80003db4:	86078793          	addi	a5,a5,-1952 # 8000b610 <_ZTV7WorkerC+0x10>
    80003db8:	00f53023          	sd	a5,0(a0)
    80003dbc:	ffffe097          	auipc	ra,0xffffe
    80003dc0:	520080e7          	jalr	1312(ra) # 800022dc <_ZN6ThreadD1Ev>
    80003dc4:	00813083          	ld	ra,8(sp)
    80003dc8:	00013403          	ld	s0,0(sp)
    80003dcc:	01010113          	addi	sp,sp,16
    80003dd0:	00008067          	ret

0000000080003dd4 <_ZN7WorkerCD0Ev>:
    80003dd4:	fe010113          	addi	sp,sp,-32
    80003dd8:	00113c23          	sd	ra,24(sp)
    80003ddc:	00813823          	sd	s0,16(sp)
    80003de0:	00913423          	sd	s1,8(sp)
    80003de4:	02010413          	addi	s0,sp,32
    80003de8:	00050493          	mv	s1,a0
    80003dec:	00008797          	auipc	a5,0x8
    80003df0:	82478793          	addi	a5,a5,-2012 # 8000b610 <_ZTV7WorkerC+0x10>
    80003df4:	00f53023          	sd	a5,0(a0)
    80003df8:	ffffe097          	auipc	ra,0xffffe
    80003dfc:	4e4080e7          	jalr	1252(ra) # 800022dc <_ZN6ThreadD1Ev>
    80003e00:	00048513          	mv	a0,s1
    80003e04:	ffffe097          	auipc	ra,0xffffe
    80003e08:	4b0080e7          	jalr	1200(ra) # 800022b4 <_ZdlPv>
    80003e0c:	01813083          	ld	ra,24(sp)
    80003e10:	01013403          	ld	s0,16(sp)
    80003e14:	00813483          	ld	s1,8(sp)
    80003e18:	02010113          	addi	sp,sp,32
    80003e1c:	00008067          	ret

0000000080003e20 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80003e20:	ff010113          	addi	sp,sp,-16
    80003e24:	00113423          	sd	ra,8(sp)
    80003e28:	00813023          	sd	s0,0(sp)
    80003e2c:	01010413          	addi	s0,sp,16
    80003e30:	00008797          	auipc	a5,0x8
    80003e34:	80878793          	addi	a5,a5,-2040 # 8000b638 <_ZTV7WorkerD+0x10>
    80003e38:	00f53023          	sd	a5,0(a0)
    80003e3c:	ffffe097          	auipc	ra,0xffffe
    80003e40:	4a0080e7          	jalr	1184(ra) # 800022dc <_ZN6ThreadD1Ev>
    80003e44:	00813083          	ld	ra,8(sp)
    80003e48:	00013403          	ld	s0,0(sp)
    80003e4c:	01010113          	addi	sp,sp,16
    80003e50:	00008067          	ret

0000000080003e54 <_ZN7WorkerDD0Ev>:
    80003e54:	fe010113          	addi	sp,sp,-32
    80003e58:	00113c23          	sd	ra,24(sp)
    80003e5c:	00813823          	sd	s0,16(sp)
    80003e60:	00913423          	sd	s1,8(sp)
    80003e64:	02010413          	addi	s0,sp,32
    80003e68:	00050493          	mv	s1,a0
    80003e6c:	00007797          	auipc	a5,0x7
    80003e70:	7cc78793          	addi	a5,a5,1996 # 8000b638 <_ZTV7WorkerD+0x10>
    80003e74:	00f53023          	sd	a5,0(a0)
    80003e78:	ffffe097          	auipc	ra,0xffffe
    80003e7c:	464080e7          	jalr	1124(ra) # 800022dc <_ZN6ThreadD1Ev>
    80003e80:	00048513          	mv	a0,s1
    80003e84:	ffffe097          	auipc	ra,0xffffe
    80003e88:	430080e7          	jalr	1072(ra) # 800022b4 <_ZdlPv>
    80003e8c:	01813083          	ld	ra,24(sp)
    80003e90:	01013403          	ld	s0,16(sp)
    80003e94:	00813483          	ld	s1,8(sp)
    80003e98:	02010113          	addi	sp,sp,32
    80003e9c:	00008067          	ret

0000000080003ea0 <_ZN7WorkerA3runEv>:
    void run() override {
    80003ea0:	ff010113          	addi	sp,sp,-16
    80003ea4:	00113423          	sd	ra,8(sp)
    80003ea8:	00813023          	sd	s0,0(sp)
    80003eac:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80003eb0:	00000593          	li	a1,0
    80003eb4:	fffff097          	auipc	ra,0xfffff
    80003eb8:	774080e7          	jalr	1908(ra) # 80003628 <_ZN7WorkerA11workerBodyAEPv>
    }
    80003ebc:	00813083          	ld	ra,8(sp)
    80003ec0:	00013403          	ld	s0,0(sp)
    80003ec4:	01010113          	addi	sp,sp,16
    80003ec8:	00008067          	ret

0000000080003ecc <_ZN7WorkerB3runEv>:
    void run() override {
    80003ecc:	ff010113          	addi	sp,sp,-16
    80003ed0:	00113423          	sd	ra,8(sp)
    80003ed4:	00813023          	sd	s0,0(sp)
    80003ed8:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80003edc:	00000593          	li	a1,0
    80003ee0:	00000097          	auipc	ra,0x0
    80003ee4:	814080e7          	jalr	-2028(ra) # 800036f4 <_ZN7WorkerB11workerBodyBEPv>
    }
    80003ee8:	00813083          	ld	ra,8(sp)
    80003eec:	00013403          	ld	s0,0(sp)
    80003ef0:	01010113          	addi	sp,sp,16
    80003ef4:	00008067          	ret

0000000080003ef8 <_ZN7WorkerC3runEv>:
    void run() override {
    80003ef8:	ff010113          	addi	sp,sp,-16
    80003efc:	00113423          	sd	ra,8(sp)
    80003f00:	00813023          	sd	s0,0(sp)
    80003f04:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80003f08:	00000593          	li	a1,0
    80003f0c:	00000097          	auipc	ra,0x0
    80003f10:	8bc080e7          	jalr	-1860(ra) # 800037c8 <_ZN7WorkerC11workerBodyCEPv>
    }
    80003f14:	00813083          	ld	ra,8(sp)
    80003f18:	00013403          	ld	s0,0(sp)
    80003f1c:	01010113          	addi	sp,sp,16
    80003f20:	00008067          	ret

0000000080003f24 <_ZN7WorkerD3runEv>:
    void run() override {
    80003f24:	ff010113          	addi	sp,sp,-16
    80003f28:	00113423          	sd	ra,8(sp)
    80003f2c:	00813023          	sd	s0,0(sp)
    80003f30:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80003f34:	00000593          	li	a1,0
    80003f38:	00000097          	auipc	ra,0x0
    80003f3c:	a10080e7          	jalr	-1520(ra) # 80003948 <_ZN7WorkerD11workerBodyDEPv>
    }
    80003f40:	00813083          	ld	ra,8(sp)
    80003f44:	00013403          	ld	s0,0(sp)
    80003f48:	01010113          	addi	sp,sp,16
    80003f4c:	00008067          	ret

0000000080003f50 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80003f50:	f8010113          	addi	sp,sp,-128
    80003f54:	06113c23          	sd	ra,120(sp)
    80003f58:	06813823          	sd	s0,112(sp)
    80003f5c:	06913423          	sd	s1,104(sp)
    80003f60:	07213023          	sd	s2,96(sp)
    80003f64:	05313c23          	sd	s3,88(sp)
    80003f68:	05413823          	sd	s4,80(sp)
    80003f6c:	05513423          	sd	s5,72(sp)
    80003f70:	05613023          	sd	s6,64(sp)
    80003f74:	03713c23          	sd	s7,56(sp)
    80003f78:	03813823          	sd	s8,48(sp)
    80003f7c:	03913423          	sd	s9,40(sp)
    80003f80:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80003f84:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80003f88:	00005517          	auipc	a0,0x5
    80003f8c:	09850513          	addi	a0,a0,152 # 80009020 <CONSOLE_STATUS+0x10>
    80003f90:	00001097          	auipc	ra,0x1
    80003f94:	5a8080e7          	jalr	1448(ra) # 80005538 <_Z11printStringPKc>
    getString(input, 30);
    80003f98:	01e00593          	li	a1,30
    80003f9c:	f8040493          	addi	s1,s0,-128
    80003fa0:	00048513          	mv	a0,s1
    80003fa4:	00001097          	auipc	ra,0x1
    80003fa8:	61c080e7          	jalr	1564(ra) # 800055c0 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003fac:	00048513          	mv	a0,s1
    80003fb0:	00001097          	auipc	ra,0x1
    80003fb4:	6e8080e7          	jalr	1768(ra) # 80005698 <_Z11stringToIntPKc>
    80003fb8:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80003fbc:	00005517          	auipc	a0,0x5
    80003fc0:	08450513          	addi	a0,a0,132 # 80009040 <CONSOLE_STATUS+0x30>
    80003fc4:	00001097          	auipc	ra,0x1
    80003fc8:	574080e7          	jalr	1396(ra) # 80005538 <_Z11printStringPKc>
    getString(input, 30);
    80003fcc:	01e00593          	li	a1,30
    80003fd0:	00048513          	mv	a0,s1
    80003fd4:	00001097          	auipc	ra,0x1
    80003fd8:	5ec080e7          	jalr	1516(ra) # 800055c0 <_Z9getStringPci>
    n = stringToInt(input);
    80003fdc:	00048513          	mv	a0,s1
    80003fe0:	00001097          	auipc	ra,0x1
    80003fe4:	6b8080e7          	jalr	1720(ra) # 80005698 <_Z11stringToIntPKc>
    80003fe8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80003fec:	00005517          	auipc	a0,0x5
    80003ff0:	07450513          	addi	a0,a0,116 # 80009060 <CONSOLE_STATUS+0x50>
    80003ff4:	00001097          	auipc	ra,0x1
    80003ff8:	544080e7          	jalr	1348(ra) # 80005538 <_Z11printStringPKc>
    printInt(threadNum);
    80003ffc:	00000613          	li	a2,0
    80004000:	00a00593          	li	a1,10
    80004004:	00098513          	mv	a0,s3
    80004008:	00001097          	auipc	ra,0x1
    8000400c:	6e0080e7          	jalr	1760(ra) # 800056e8 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80004010:	00005517          	auipc	a0,0x5
    80004014:	06850513          	addi	a0,a0,104 # 80009078 <CONSOLE_STATUS+0x68>
    80004018:	00001097          	auipc	ra,0x1
    8000401c:	520080e7          	jalr	1312(ra) # 80005538 <_Z11printStringPKc>
    printInt(n);
    80004020:	00000613          	li	a2,0
    80004024:	00a00593          	li	a1,10
    80004028:	00048513          	mv	a0,s1
    8000402c:	00001097          	auipc	ra,0x1
    80004030:	6bc080e7          	jalr	1724(ra) # 800056e8 <_Z8printIntiii>
    printString(".\n");
    80004034:	00005517          	auipc	a0,0x5
    80004038:	05c50513          	addi	a0,a0,92 # 80009090 <CONSOLE_STATUS+0x80>
    8000403c:	00001097          	auipc	ra,0x1
    80004040:	4fc080e7          	jalr	1276(ra) # 80005538 <_Z11printStringPKc>
    if (threadNum > n) {
    80004044:	0334c463          	blt	s1,s3,8000406c <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80004048:	03305c63          	blez	s3,80004080 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    8000404c:	03800513          	li	a0,56
    80004050:	ffffe097          	auipc	ra,0xffffe
    80004054:	23c080e7          	jalr	572(ra) # 8000228c <_Znwm>
    80004058:	00050a93          	mv	s5,a0
    8000405c:	00048593          	mv	a1,s1
    80004060:	00001097          	auipc	ra,0x1
    80004064:	7a8080e7          	jalr	1960(ra) # 80005808 <_ZN9BufferCPPC1Ei>
    80004068:	0300006f          	j	80004098 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000406c:	00005517          	auipc	a0,0x5
    80004070:	02c50513          	addi	a0,a0,44 # 80009098 <CONSOLE_STATUS+0x88>
    80004074:	00001097          	auipc	ra,0x1
    80004078:	4c4080e7          	jalr	1220(ra) # 80005538 <_Z11printStringPKc>
        return;
    8000407c:	0140006f          	j	80004090 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004080:	00005517          	auipc	a0,0x5
    80004084:	05850513          	addi	a0,a0,88 # 800090d8 <CONSOLE_STATUS+0xc8>
    80004088:	00001097          	auipc	ra,0x1
    8000408c:	4b0080e7          	jalr	1200(ra) # 80005538 <_Z11printStringPKc>
        return;
    80004090:	000c0113          	mv	sp,s8
    80004094:	2140006f          	j	800042a8 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80004098:	01000513          	li	a0,16
    8000409c:	ffffe097          	auipc	ra,0xffffe
    800040a0:	1f0080e7          	jalr	496(ra) # 8000228c <_Znwm>
    800040a4:	00050913          	mv	s2,a0
    800040a8:	00000593          	li	a1,0
    800040ac:	ffffe097          	auipc	ra,0xffffe
    800040b0:	42c080e7          	jalr	1068(ra) # 800024d8 <_ZN9SemaphoreC1Ej>
    800040b4:	00007797          	auipc	a5,0x7
    800040b8:	7d27b623          	sd	s2,1996(a5) # 8000b880 <_ZL10waitForAll>
    Thread *producers[threadNum];
    800040bc:	00399793          	slli	a5,s3,0x3
    800040c0:	00f78793          	addi	a5,a5,15
    800040c4:	ff07f793          	andi	a5,a5,-16
    800040c8:	40f10133          	sub	sp,sp,a5
    800040cc:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    800040d0:	0019871b          	addiw	a4,s3,1
    800040d4:	00171793          	slli	a5,a4,0x1
    800040d8:	00e787b3          	add	a5,a5,a4
    800040dc:	00379793          	slli	a5,a5,0x3
    800040e0:	00f78793          	addi	a5,a5,15
    800040e4:	ff07f793          	andi	a5,a5,-16
    800040e8:	40f10133          	sub	sp,sp,a5
    800040ec:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    800040f0:	00199493          	slli	s1,s3,0x1
    800040f4:	013484b3          	add	s1,s1,s3
    800040f8:	00349493          	slli	s1,s1,0x3
    800040fc:	009b04b3          	add	s1,s6,s1
    80004100:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80004104:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80004108:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    8000410c:	02800513          	li	a0,40
    80004110:	ffffe097          	auipc	ra,0xffffe
    80004114:	17c080e7          	jalr	380(ra) # 8000228c <_Znwm>
    80004118:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    8000411c:	ffffe097          	auipc	ra,0xffffe
    80004120:	378080e7          	jalr	888(ra) # 80002494 <_ZN6ThreadC1Ev>
    80004124:	00007797          	auipc	a5,0x7
    80004128:	58c78793          	addi	a5,a5,1420 # 8000b6b0 <_ZTV8Consumer+0x10>
    8000412c:	00fbb023          	sd	a5,0(s7)
    80004130:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80004134:	000b8513          	mv	a0,s7
    80004138:	ffffe097          	auipc	ra,0xffffe
    8000413c:	29c080e7          	jalr	668(ra) # 800023d4 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80004140:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80004144:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80004148:	00007797          	auipc	a5,0x7
    8000414c:	7387b783          	ld	a5,1848(a5) # 8000b880 <_ZL10waitForAll>
    80004150:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004154:	02800513          	li	a0,40
    80004158:	ffffe097          	auipc	ra,0xffffe
    8000415c:	134080e7          	jalr	308(ra) # 8000228c <_Znwm>
    80004160:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80004164:	ffffe097          	auipc	ra,0xffffe
    80004168:	330080e7          	jalr	816(ra) # 80002494 <_ZN6ThreadC1Ev>
    8000416c:	00007797          	auipc	a5,0x7
    80004170:	4f478793          	addi	a5,a5,1268 # 8000b660 <_ZTV16ProducerKeyborad+0x10>
    80004174:	00f4b023          	sd	a5,0(s1)
    80004178:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    8000417c:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80004180:	00048513          	mv	a0,s1
    80004184:	ffffe097          	auipc	ra,0xffffe
    80004188:	250080e7          	jalr	592(ra) # 800023d4 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    8000418c:	00100913          	li	s2,1
    80004190:	0300006f          	j	800041c0 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004194:	00007797          	auipc	a5,0x7
    80004198:	4f478793          	addi	a5,a5,1268 # 8000b688 <_ZTV8Producer+0x10>
    8000419c:	00fcb023          	sd	a5,0(s9)
    800041a0:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    800041a4:	00391793          	slli	a5,s2,0x3
    800041a8:	00fa07b3          	add	a5,s4,a5
    800041ac:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    800041b0:	000c8513          	mv	a0,s9
    800041b4:	ffffe097          	auipc	ra,0xffffe
    800041b8:	220080e7          	jalr	544(ra) # 800023d4 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800041bc:	0019091b          	addiw	s2,s2,1
    800041c0:	05395263          	bge	s2,s3,80004204 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    800041c4:	00191493          	slli	s1,s2,0x1
    800041c8:	012484b3          	add	s1,s1,s2
    800041cc:	00349493          	slli	s1,s1,0x3
    800041d0:	009b04b3          	add	s1,s6,s1
    800041d4:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    800041d8:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    800041dc:	00007797          	auipc	a5,0x7
    800041e0:	6a47b783          	ld	a5,1700(a5) # 8000b880 <_ZL10waitForAll>
    800041e4:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    800041e8:	02800513          	li	a0,40
    800041ec:	ffffe097          	auipc	ra,0xffffe
    800041f0:	0a0080e7          	jalr	160(ra) # 8000228c <_Znwm>
    800041f4:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800041f8:	ffffe097          	auipc	ra,0xffffe
    800041fc:	29c080e7          	jalr	668(ra) # 80002494 <_ZN6ThreadC1Ev>
    80004200:	f95ff06f          	j	80004194 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80004204:	ffffe097          	auipc	ra,0xffffe
    80004208:	240080e7          	jalr	576(ra) # 80002444 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    8000420c:	00000493          	li	s1,0
    80004210:	0099ce63          	blt	s3,s1,8000422c <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80004214:	00007517          	auipc	a0,0x7
    80004218:	66c53503          	ld	a0,1644(a0) # 8000b880 <_ZL10waitForAll>
    8000421c:	ffffe097          	auipc	ra,0xffffe
    80004220:	2f4080e7          	jalr	756(ra) # 80002510 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004224:	0014849b          	addiw	s1,s1,1
    80004228:	fe9ff06f          	j	80004210 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    8000422c:	00007517          	auipc	a0,0x7
    80004230:	65453503          	ld	a0,1620(a0) # 8000b880 <_ZL10waitForAll>
    80004234:	00050863          	beqz	a0,80004244 <_Z20testConsumerProducerv+0x2f4>
    80004238:	00053783          	ld	a5,0(a0)
    8000423c:	0087b783          	ld	a5,8(a5)
    80004240:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80004244:	00000493          	li	s1,0
    80004248:	0080006f          	j	80004250 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    8000424c:	0014849b          	addiw	s1,s1,1
    80004250:	0334d263          	bge	s1,s3,80004274 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80004254:	00349793          	slli	a5,s1,0x3
    80004258:	00fa07b3          	add	a5,s4,a5
    8000425c:	0007b503          	ld	a0,0(a5)
    80004260:	fe0506e3          	beqz	a0,8000424c <_Z20testConsumerProducerv+0x2fc>
    80004264:	00053783          	ld	a5,0(a0)
    80004268:	0087b783          	ld	a5,8(a5)
    8000426c:	000780e7          	jalr	a5
    80004270:	fddff06f          	j	8000424c <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80004274:	000b8a63          	beqz	s7,80004288 <_Z20testConsumerProducerv+0x338>
    80004278:	000bb783          	ld	a5,0(s7)
    8000427c:	0087b783          	ld	a5,8(a5)
    80004280:	000b8513          	mv	a0,s7
    80004284:	000780e7          	jalr	a5
    delete buffer;
    80004288:	000a8e63          	beqz	s5,800042a4 <_Z20testConsumerProducerv+0x354>
    8000428c:	000a8513          	mv	a0,s5
    80004290:	00002097          	auipc	ra,0x2
    80004294:	870080e7          	jalr	-1936(ra) # 80005b00 <_ZN9BufferCPPD1Ev>
    80004298:	000a8513          	mv	a0,s5
    8000429c:	ffffe097          	auipc	ra,0xffffe
    800042a0:	018080e7          	jalr	24(ra) # 800022b4 <_ZdlPv>
    800042a4:	000c0113          	mv	sp,s8
}
    800042a8:	f8040113          	addi	sp,s0,-128
    800042ac:	07813083          	ld	ra,120(sp)
    800042b0:	07013403          	ld	s0,112(sp)
    800042b4:	06813483          	ld	s1,104(sp)
    800042b8:	06013903          	ld	s2,96(sp)
    800042bc:	05813983          	ld	s3,88(sp)
    800042c0:	05013a03          	ld	s4,80(sp)
    800042c4:	04813a83          	ld	s5,72(sp)
    800042c8:	04013b03          	ld	s6,64(sp)
    800042cc:	03813b83          	ld	s7,56(sp)
    800042d0:	03013c03          	ld	s8,48(sp)
    800042d4:	02813c83          	ld	s9,40(sp)
    800042d8:	08010113          	addi	sp,sp,128
    800042dc:	00008067          	ret
    800042e0:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    800042e4:	000a8513          	mv	a0,s5
    800042e8:	ffffe097          	auipc	ra,0xffffe
    800042ec:	fcc080e7          	jalr	-52(ra) # 800022b4 <_ZdlPv>
    800042f0:	00048513          	mv	a0,s1
    800042f4:	00008097          	auipc	ra,0x8
    800042f8:	684080e7          	jalr	1668(ra) # 8000c978 <_Unwind_Resume>
    800042fc:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80004300:	00090513          	mv	a0,s2
    80004304:	ffffe097          	auipc	ra,0xffffe
    80004308:	fb0080e7          	jalr	-80(ra) # 800022b4 <_ZdlPv>
    8000430c:	00048513          	mv	a0,s1
    80004310:	00008097          	auipc	ra,0x8
    80004314:	668080e7          	jalr	1640(ra) # 8000c978 <_Unwind_Resume>
    80004318:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    8000431c:	000b8513          	mv	a0,s7
    80004320:	ffffe097          	auipc	ra,0xffffe
    80004324:	f94080e7          	jalr	-108(ra) # 800022b4 <_ZdlPv>
    80004328:	00048513          	mv	a0,s1
    8000432c:	00008097          	auipc	ra,0x8
    80004330:	64c080e7          	jalr	1612(ra) # 8000c978 <_Unwind_Resume>
    80004334:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004338:	00048513          	mv	a0,s1
    8000433c:	ffffe097          	auipc	ra,0xffffe
    80004340:	f78080e7          	jalr	-136(ra) # 800022b4 <_ZdlPv>
    80004344:	00090513          	mv	a0,s2
    80004348:	00008097          	auipc	ra,0x8
    8000434c:	630080e7          	jalr	1584(ra) # 8000c978 <_Unwind_Resume>
    80004350:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80004354:	000c8513          	mv	a0,s9
    80004358:	ffffe097          	auipc	ra,0xffffe
    8000435c:	f5c080e7          	jalr	-164(ra) # 800022b4 <_ZdlPv>
    80004360:	00048513          	mv	a0,s1
    80004364:	00008097          	auipc	ra,0x8
    80004368:	614080e7          	jalr	1556(ra) # 8000c978 <_Unwind_Resume>

000000008000436c <_ZN8Consumer3runEv>:
    void run() override {
    8000436c:	fd010113          	addi	sp,sp,-48
    80004370:	02113423          	sd	ra,40(sp)
    80004374:	02813023          	sd	s0,32(sp)
    80004378:	00913c23          	sd	s1,24(sp)
    8000437c:	01213823          	sd	s2,16(sp)
    80004380:	01313423          	sd	s3,8(sp)
    80004384:	03010413          	addi	s0,sp,48
    80004388:	00050913          	mv	s2,a0
        int i = 0;
    8000438c:	00000993          	li	s3,0
    80004390:	0100006f          	j	800043a0 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80004394:	00a00513          	li	a0,10
    80004398:	ffffe097          	auipc	ra,0xffffe
    8000439c:	26c080e7          	jalr	620(ra) # 80002604 <_ZN7Console4putcEc>
        while (!threadEnd) {
    800043a0:	00007797          	auipc	a5,0x7
    800043a4:	4d87a783          	lw	a5,1240(a5) # 8000b878 <_ZL9threadEnd>
    800043a8:	04079a63          	bnez	a5,800043fc <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    800043ac:	02093783          	ld	a5,32(s2)
    800043b0:	0087b503          	ld	a0,8(a5)
    800043b4:	00001097          	auipc	ra,0x1
    800043b8:	638080e7          	jalr	1592(ra) # 800059ec <_ZN9BufferCPP3getEv>
            i++;
    800043bc:	0019849b          	addiw	s1,s3,1
    800043c0:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    800043c4:	0ff57513          	andi	a0,a0,255
    800043c8:	ffffe097          	auipc	ra,0xffffe
    800043cc:	23c080e7          	jalr	572(ra) # 80002604 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    800043d0:	05000793          	li	a5,80
    800043d4:	02f4e4bb          	remw	s1,s1,a5
    800043d8:	fc0494e3          	bnez	s1,800043a0 <_ZN8Consumer3runEv+0x34>
    800043dc:	fb9ff06f          	j	80004394 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    800043e0:	02093783          	ld	a5,32(s2)
    800043e4:	0087b503          	ld	a0,8(a5)
    800043e8:	00001097          	auipc	ra,0x1
    800043ec:	604080e7          	jalr	1540(ra) # 800059ec <_ZN9BufferCPP3getEv>
            Console::putc(key);
    800043f0:	0ff57513          	andi	a0,a0,255
    800043f4:	ffffe097          	auipc	ra,0xffffe
    800043f8:	210080e7          	jalr	528(ra) # 80002604 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    800043fc:	02093783          	ld	a5,32(s2)
    80004400:	0087b503          	ld	a0,8(a5)
    80004404:	00001097          	auipc	ra,0x1
    80004408:	674080e7          	jalr	1652(ra) # 80005a78 <_ZN9BufferCPP6getCntEv>
    8000440c:	fca04ae3          	bgtz	a0,800043e0 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80004410:	02093783          	ld	a5,32(s2)
    80004414:	0107b503          	ld	a0,16(a5)
    80004418:	ffffe097          	auipc	ra,0xffffe
    8000441c:	124080e7          	jalr	292(ra) # 8000253c <_ZN9Semaphore6signalEv>
    }
    80004420:	02813083          	ld	ra,40(sp)
    80004424:	02013403          	ld	s0,32(sp)
    80004428:	01813483          	ld	s1,24(sp)
    8000442c:	01013903          	ld	s2,16(sp)
    80004430:	00813983          	ld	s3,8(sp)
    80004434:	03010113          	addi	sp,sp,48
    80004438:	00008067          	ret

000000008000443c <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    8000443c:	ff010113          	addi	sp,sp,-16
    80004440:	00113423          	sd	ra,8(sp)
    80004444:	00813023          	sd	s0,0(sp)
    80004448:	01010413          	addi	s0,sp,16
    8000444c:	00007797          	auipc	a5,0x7
    80004450:	26478793          	addi	a5,a5,612 # 8000b6b0 <_ZTV8Consumer+0x10>
    80004454:	00f53023          	sd	a5,0(a0)
    80004458:	ffffe097          	auipc	ra,0xffffe
    8000445c:	e84080e7          	jalr	-380(ra) # 800022dc <_ZN6ThreadD1Ev>
    80004460:	00813083          	ld	ra,8(sp)
    80004464:	00013403          	ld	s0,0(sp)
    80004468:	01010113          	addi	sp,sp,16
    8000446c:	00008067          	ret

0000000080004470 <_ZN8ConsumerD0Ev>:
    80004470:	fe010113          	addi	sp,sp,-32
    80004474:	00113c23          	sd	ra,24(sp)
    80004478:	00813823          	sd	s0,16(sp)
    8000447c:	00913423          	sd	s1,8(sp)
    80004480:	02010413          	addi	s0,sp,32
    80004484:	00050493          	mv	s1,a0
    80004488:	00007797          	auipc	a5,0x7
    8000448c:	22878793          	addi	a5,a5,552 # 8000b6b0 <_ZTV8Consumer+0x10>
    80004490:	00f53023          	sd	a5,0(a0)
    80004494:	ffffe097          	auipc	ra,0xffffe
    80004498:	e48080e7          	jalr	-440(ra) # 800022dc <_ZN6ThreadD1Ev>
    8000449c:	00048513          	mv	a0,s1
    800044a0:	ffffe097          	auipc	ra,0xffffe
    800044a4:	e14080e7          	jalr	-492(ra) # 800022b4 <_ZdlPv>
    800044a8:	01813083          	ld	ra,24(sp)
    800044ac:	01013403          	ld	s0,16(sp)
    800044b0:	00813483          	ld	s1,8(sp)
    800044b4:	02010113          	addi	sp,sp,32
    800044b8:	00008067          	ret

00000000800044bc <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    800044bc:	ff010113          	addi	sp,sp,-16
    800044c0:	00113423          	sd	ra,8(sp)
    800044c4:	00813023          	sd	s0,0(sp)
    800044c8:	01010413          	addi	s0,sp,16
    800044cc:	00007797          	auipc	a5,0x7
    800044d0:	19478793          	addi	a5,a5,404 # 8000b660 <_ZTV16ProducerKeyborad+0x10>
    800044d4:	00f53023          	sd	a5,0(a0)
    800044d8:	ffffe097          	auipc	ra,0xffffe
    800044dc:	e04080e7          	jalr	-508(ra) # 800022dc <_ZN6ThreadD1Ev>
    800044e0:	00813083          	ld	ra,8(sp)
    800044e4:	00013403          	ld	s0,0(sp)
    800044e8:	01010113          	addi	sp,sp,16
    800044ec:	00008067          	ret

00000000800044f0 <_ZN16ProducerKeyboradD0Ev>:
    800044f0:	fe010113          	addi	sp,sp,-32
    800044f4:	00113c23          	sd	ra,24(sp)
    800044f8:	00813823          	sd	s0,16(sp)
    800044fc:	00913423          	sd	s1,8(sp)
    80004500:	02010413          	addi	s0,sp,32
    80004504:	00050493          	mv	s1,a0
    80004508:	00007797          	auipc	a5,0x7
    8000450c:	15878793          	addi	a5,a5,344 # 8000b660 <_ZTV16ProducerKeyborad+0x10>
    80004510:	00f53023          	sd	a5,0(a0)
    80004514:	ffffe097          	auipc	ra,0xffffe
    80004518:	dc8080e7          	jalr	-568(ra) # 800022dc <_ZN6ThreadD1Ev>
    8000451c:	00048513          	mv	a0,s1
    80004520:	ffffe097          	auipc	ra,0xffffe
    80004524:	d94080e7          	jalr	-620(ra) # 800022b4 <_ZdlPv>
    80004528:	01813083          	ld	ra,24(sp)
    8000452c:	01013403          	ld	s0,16(sp)
    80004530:	00813483          	ld	s1,8(sp)
    80004534:	02010113          	addi	sp,sp,32
    80004538:	00008067          	ret

000000008000453c <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    8000453c:	ff010113          	addi	sp,sp,-16
    80004540:	00113423          	sd	ra,8(sp)
    80004544:	00813023          	sd	s0,0(sp)
    80004548:	01010413          	addi	s0,sp,16
    8000454c:	00007797          	auipc	a5,0x7
    80004550:	13c78793          	addi	a5,a5,316 # 8000b688 <_ZTV8Producer+0x10>
    80004554:	00f53023          	sd	a5,0(a0)
    80004558:	ffffe097          	auipc	ra,0xffffe
    8000455c:	d84080e7          	jalr	-636(ra) # 800022dc <_ZN6ThreadD1Ev>
    80004560:	00813083          	ld	ra,8(sp)
    80004564:	00013403          	ld	s0,0(sp)
    80004568:	01010113          	addi	sp,sp,16
    8000456c:	00008067          	ret

0000000080004570 <_ZN8ProducerD0Ev>:
    80004570:	fe010113          	addi	sp,sp,-32
    80004574:	00113c23          	sd	ra,24(sp)
    80004578:	00813823          	sd	s0,16(sp)
    8000457c:	00913423          	sd	s1,8(sp)
    80004580:	02010413          	addi	s0,sp,32
    80004584:	00050493          	mv	s1,a0
    80004588:	00007797          	auipc	a5,0x7
    8000458c:	10078793          	addi	a5,a5,256 # 8000b688 <_ZTV8Producer+0x10>
    80004590:	00f53023          	sd	a5,0(a0)
    80004594:	ffffe097          	auipc	ra,0xffffe
    80004598:	d48080e7          	jalr	-696(ra) # 800022dc <_ZN6ThreadD1Ev>
    8000459c:	00048513          	mv	a0,s1
    800045a0:	ffffe097          	auipc	ra,0xffffe
    800045a4:	d14080e7          	jalr	-748(ra) # 800022b4 <_ZdlPv>
    800045a8:	01813083          	ld	ra,24(sp)
    800045ac:	01013403          	ld	s0,16(sp)
    800045b0:	00813483          	ld	s1,8(sp)
    800045b4:	02010113          	addi	sp,sp,32
    800045b8:	00008067          	ret

00000000800045bc <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    800045bc:	fe010113          	addi	sp,sp,-32
    800045c0:	00113c23          	sd	ra,24(sp)
    800045c4:	00813823          	sd	s0,16(sp)
    800045c8:	00913423          	sd	s1,8(sp)
    800045cc:	02010413          	addi	s0,sp,32
    800045d0:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    800045d4:	ffffd097          	auipc	ra,0xffffd
    800045d8:	110080e7          	jalr	272(ra) # 800016e4 <_Z4getcv>
    800045dc:	0005059b          	sext.w	a1,a0
    800045e0:	01b00793          	li	a5,27
    800045e4:	00f58c63          	beq	a1,a5,800045fc <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    800045e8:	0204b783          	ld	a5,32(s1)
    800045ec:	0087b503          	ld	a0,8(a5)
    800045f0:	00001097          	auipc	ra,0x1
    800045f4:	36c080e7          	jalr	876(ra) # 8000595c <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    800045f8:	fddff06f          	j	800045d4 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    800045fc:	00100793          	li	a5,1
    80004600:	00007717          	auipc	a4,0x7
    80004604:	26f72c23          	sw	a5,632(a4) # 8000b878 <_ZL9threadEnd>
        td->buffer->put('!');
    80004608:	0204b783          	ld	a5,32(s1)
    8000460c:	02100593          	li	a1,33
    80004610:	0087b503          	ld	a0,8(a5)
    80004614:	00001097          	auipc	ra,0x1
    80004618:	348080e7          	jalr	840(ra) # 8000595c <_ZN9BufferCPP3putEi>
        td->sem->signal();
    8000461c:	0204b783          	ld	a5,32(s1)
    80004620:	0107b503          	ld	a0,16(a5)
    80004624:	ffffe097          	auipc	ra,0xffffe
    80004628:	f18080e7          	jalr	-232(ra) # 8000253c <_ZN9Semaphore6signalEv>
    }
    8000462c:	01813083          	ld	ra,24(sp)
    80004630:	01013403          	ld	s0,16(sp)
    80004634:	00813483          	ld	s1,8(sp)
    80004638:	02010113          	addi	sp,sp,32
    8000463c:	00008067          	ret

0000000080004640 <_ZN8Producer3runEv>:
    void run() override {
    80004640:	fe010113          	addi	sp,sp,-32
    80004644:	00113c23          	sd	ra,24(sp)
    80004648:	00813823          	sd	s0,16(sp)
    8000464c:	00913423          	sd	s1,8(sp)
    80004650:	01213023          	sd	s2,0(sp)
    80004654:	02010413          	addi	s0,sp,32
    80004658:	00050493          	mv	s1,a0
        int i = 0;
    8000465c:	00000913          	li	s2,0
        while (!threadEnd) {
    80004660:	00007797          	auipc	a5,0x7
    80004664:	2187a783          	lw	a5,536(a5) # 8000b878 <_ZL9threadEnd>
    80004668:	04079263          	bnez	a5,800046ac <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    8000466c:	0204b783          	ld	a5,32(s1)
    80004670:	0007a583          	lw	a1,0(a5)
    80004674:	0305859b          	addiw	a1,a1,48
    80004678:	0087b503          	ld	a0,8(a5)
    8000467c:	00001097          	auipc	ra,0x1
    80004680:	2e0080e7          	jalr	736(ra) # 8000595c <_ZN9BufferCPP3putEi>
            i++;
    80004684:	0019071b          	addiw	a4,s2,1
    80004688:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    8000468c:	0204b783          	ld	a5,32(s1)
    80004690:	0007a783          	lw	a5,0(a5)
    80004694:	00e787bb          	addw	a5,a5,a4
    80004698:	00500513          	li	a0,5
    8000469c:	02a7e53b          	remw	a0,a5,a0
    800046a0:	ffffe097          	auipc	ra,0xffffe
    800046a4:	dcc080e7          	jalr	-564(ra) # 8000246c <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    800046a8:	fb9ff06f          	j	80004660 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    800046ac:	0204b783          	ld	a5,32(s1)
    800046b0:	0107b503          	ld	a0,16(a5)
    800046b4:	ffffe097          	auipc	ra,0xffffe
    800046b8:	e88080e7          	jalr	-376(ra) # 8000253c <_ZN9Semaphore6signalEv>
    }
    800046bc:	01813083          	ld	ra,24(sp)
    800046c0:	01013403          	ld	s0,16(sp)
    800046c4:	00813483          	ld	s1,8(sp)
    800046c8:	00013903          	ld	s2,0(sp)
    800046cc:	02010113          	addi	sp,sp,32
    800046d0:	00008067          	ret

00000000800046d4 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800046d4:	fe010113          	addi	sp,sp,-32
    800046d8:	00113c23          	sd	ra,24(sp)
    800046dc:	00813823          	sd	s0,16(sp)
    800046e0:	00913423          	sd	s1,8(sp)
    800046e4:	01213023          	sd	s2,0(sp)
    800046e8:	02010413          	addi	s0,sp,32
    800046ec:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800046f0:	00100793          	li	a5,1
    800046f4:	02a7f863          	bgeu	a5,a0,80004724 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800046f8:	00a00793          	li	a5,10
    800046fc:	02f577b3          	remu	a5,a0,a5
    80004700:	02078e63          	beqz	a5,8000473c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004704:	fff48513          	addi	a0,s1,-1
    80004708:	00000097          	auipc	ra,0x0
    8000470c:	fcc080e7          	jalr	-52(ra) # 800046d4 <_ZL9fibonaccim>
    80004710:	00050913          	mv	s2,a0
    80004714:	ffe48513          	addi	a0,s1,-2
    80004718:	00000097          	auipc	ra,0x0
    8000471c:	fbc080e7          	jalr	-68(ra) # 800046d4 <_ZL9fibonaccim>
    80004720:	00a90533          	add	a0,s2,a0
}
    80004724:	01813083          	ld	ra,24(sp)
    80004728:	01013403          	ld	s0,16(sp)
    8000472c:	00813483          	ld	s1,8(sp)
    80004730:	00013903          	ld	s2,0(sp)
    80004734:	02010113          	addi	sp,sp,32
    80004738:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    8000473c:	ffffd097          	auipc	ra,0xffffd
    80004740:	dd0080e7          	jalr	-560(ra) # 8000150c <_Z15thread_dispatchv>
    80004744:	fc1ff06f          	j	80004704 <_ZL9fibonaccim+0x30>

0000000080004748 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004748:	fe010113          	addi	sp,sp,-32
    8000474c:	00113c23          	sd	ra,24(sp)
    80004750:	00813823          	sd	s0,16(sp)
    80004754:	00913423          	sd	s1,8(sp)
    80004758:	01213023          	sd	s2,0(sp)
    8000475c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004760:	00a00493          	li	s1,10
    80004764:	0400006f          	j	800047a4 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004768:	00005517          	auipc	a0,0x5
    8000476c:	a0050513          	addi	a0,a0,-1536 # 80009168 <CONSOLE_STATUS+0x158>
    80004770:	00001097          	auipc	ra,0x1
    80004774:	dc8080e7          	jalr	-568(ra) # 80005538 <_Z11printStringPKc>
    80004778:	00000613          	li	a2,0
    8000477c:	00a00593          	li	a1,10
    80004780:	00048513          	mv	a0,s1
    80004784:	00001097          	auipc	ra,0x1
    80004788:	f64080e7          	jalr	-156(ra) # 800056e8 <_Z8printIntiii>
    8000478c:	00005517          	auipc	a0,0x5
    80004790:	bcc50513          	addi	a0,a0,-1076 # 80009358 <CONSOLE_STATUS+0x348>
    80004794:	00001097          	auipc	ra,0x1
    80004798:	da4080e7          	jalr	-604(ra) # 80005538 <_Z11printStringPKc>
    for (; i < 13; i++) {
    8000479c:	0014849b          	addiw	s1,s1,1
    800047a0:	0ff4f493          	andi	s1,s1,255
    800047a4:	00c00793          	li	a5,12
    800047a8:	fc97f0e3          	bgeu	a5,s1,80004768 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800047ac:	00005517          	auipc	a0,0x5
    800047b0:	9c450513          	addi	a0,a0,-1596 # 80009170 <CONSOLE_STATUS+0x160>
    800047b4:	00001097          	auipc	ra,0x1
    800047b8:	d84080e7          	jalr	-636(ra) # 80005538 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800047bc:	00500313          	li	t1,5
    thread_dispatch();
    800047c0:	ffffd097          	auipc	ra,0xffffd
    800047c4:	d4c080e7          	jalr	-692(ra) # 8000150c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800047c8:	01000513          	li	a0,16
    800047cc:	00000097          	auipc	ra,0x0
    800047d0:	f08080e7          	jalr	-248(ra) # 800046d4 <_ZL9fibonaccim>
    800047d4:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800047d8:	00005517          	auipc	a0,0x5
    800047dc:	9a850513          	addi	a0,a0,-1624 # 80009180 <CONSOLE_STATUS+0x170>
    800047e0:	00001097          	auipc	ra,0x1
    800047e4:	d58080e7          	jalr	-680(ra) # 80005538 <_Z11printStringPKc>
    800047e8:	00000613          	li	a2,0
    800047ec:	00a00593          	li	a1,10
    800047f0:	0009051b          	sext.w	a0,s2
    800047f4:	00001097          	auipc	ra,0x1
    800047f8:	ef4080e7          	jalr	-268(ra) # 800056e8 <_Z8printIntiii>
    800047fc:	00005517          	auipc	a0,0x5
    80004800:	b5c50513          	addi	a0,a0,-1188 # 80009358 <CONSOLE_STATUS+0x348>
    80004804:	00001097          	auipc	ra,0x1
    80004808:	d34080e7          	jalr	-716(ra) # 80005538 <_Z11printStringPKc>
    8000480c:	0400006f          	j	8000484c <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004810:	00005517          	auipc	a0,0x5
    80004814:	95850513          	addi	a0,a0,-1704 # 80009168 <CONSOLE_STATUS+0x158>
    80004818:	00001097          	auipc	ra,0x1
    8000481c:	d20080e7          	jalr	-736(ra) # 80005538 <_Z11printStringPKc>
    80004820:	00000613          	li	a2,0
    80004824:	00a00593          	li	a1,10
    80004828:	00048513          	mv	a0,s1
    8000482c:	00001097          	auipc	ra,0x1
    80004830:	ebc080e7          	jalr	-324(ra) # 800056e8 <_Z8printIntiii>
    80004834:	00005517          	auipc	a0,0x5
    80004838:	b2450513          	addi	a0,a0,-1244 # 80009358 <CONSOLE_STATUS+0x348>
    8000483c:	00001097          	auipc	ra,0x1
    80004840:	cfc080e7          	jalr	-772(ra) # 80005538 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004844:	0014849b          	addiw	s1,s1,1
    80004848:	0ff4f493          	andi	s1,s1,255
    8000484c:	00f00793          	li	a5,15
    80004850:	fc97f0e3          	bgeu	a5,s1,80004810 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004854:	00005517          	auipc	a0,0x5
    80004858:	93c50513          	addi	a0,a0,-1732 # 80009190 <CONSOLE_STATUS+0x180>
    8000485c:	00001097          	auipc	ra,0x1
    80004860:	cdc080e7          	jalr	-804(ra) # 80005538 <_Z11printStringPKc>
    finishedD = true;
    80004864:	00100793          	li	a5,1
    80004868:	00007717          	auipc	a4,0x7
    8000486c:	02f70023          	sb	a5,32(a4) # 8000b888 <_ZL9finishedD>
    thread_dispatch();
    80004870:	ffffd097          	auipc	ra,0xffffd
    80004874:	c9c080e7          	jalr	-868(ra) # 8000150c <_Z15thread_dispatchv>
}
    80004878:	01813083          	ld	ra,24(sp)
    8000487c:	01013403          	ld	s0,16(sp)
    80004880:	00813483          	ld	s1,8(sp)
    80004884:	00013903          	ld	s2,0(sp)
    80004888:	02010113          	addi	sp,sp,32
    8000488c:	00008067          	ret

0000000080004890 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80004890:	fe010113          	addi	sp,sp,-32
    80004894:	00113c23          	sd	ra,24(sp)
    80004898:	00813823          	sd	s0,16(sp)
    8000489c:	00913423          	sd	s1,8(sp)
    800048a0:	01213023          	sd	s2,0(sp)
    800048a4:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800048a8:	00000493          	li	s1,0
    800048ac:	0400006f          	j	800048ec <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800048b0:	00005517          	auipc	a0,0x5
    800048b4:	88850513          	addi	a0,a0,-1912 # 80009138 <CONSOLE_STATUS+0x128>
    800048b8:	00001097          	auipc	ra,0x1
    800048bc:	c80080e7          	jalr	-896(ra) # 80005538 <_Z11printStringPKc>
    800048c0:	00000613          	li	a2,0
    800048c4:	00a00593          	li	a1,10
    800048c8:	00048513          	mv	a0,s1
    800048cc:	00001097          	auipc	ra,0x1
    800048d0:	e1c080e7          	jalr	-484(ra) # 800056e8 <_Z8printIntiii>
    800048d4:	00005517          	auipc	a0,0x5
    800048d8:	a8450513          	addi	a0,a0,-1404 # 80009358 <CONSOLE_STATUS+0x348>
    800048dc:	00001097          	auipc	ra,0x1
    800048e0:	c5c080e7          	jalr	-932(ra) # 80005538 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800048e4:	0014849b          	addiw	s1,s1,1
    800048e8:	0ff4f493          	andi	s1,s1,255
    800048ec:	00200793          	li	a5,2
    800048f0:	fc97f0e3          	bgeu	a5,s1,800048b0 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800048f4:	00005517          	auipc	a0,0x5
    800048f8:	84c50513          	addi	a0,a0,-1972 # 80009140 <CONSOLE_STATUS+0x130>
    800048fc:	00001097          	auipc	ra,0x1
    80004900:	c3c080e7          	jalr	-964(ra) # 80005538 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004904:	00700313          	li	t1,7
    thread_dispatch();
    80004908:	ffffd097          	auipc	ra,0xffffd
    8000490c:	c04080e7          	jalr	-1020(ra) # 8000150c <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004910:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80004914:	00005517          	auipc	a0,0x5
    80004918:	83c50513          	addi	a0,a0,-1988 # 80009150 <CONSOLE_STATUS+0x140>
    8000491c:	00001097          	auipc	ra,0x1
    80004920:	c1c080e7          	jalr	-996(ra) # 80005538 <_Z11printStringPKc>
    80004924:	00000613          	li	a2,0
    80004928:	00a00593          	li	a1,10
    8000492c:	0009051b          	sext.w	a0,s2
    80004930:	00001097          	auipc	ra,0x1
    80004934:	db8080e7          	jalr	-584(ra) # 800056e8 <_Z8printIntiii>
    80004938:	00005517          	auipc	a0,0x5
    8000493c:	a2050513          	addi	a0,a0,-1504 # 80009358 <CONSOLE_STATUS+0x348>
    80004940:	00001097          	auipc	ra,0x1
    80004944:	bf8080e7          	jalr	-1032(ra) # 80005538 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80004948:	00c00513          	li	a0,12
    8000494c:	00000097          	auipc	ra,0x0
    80004950:	d88080e7          	jalr	-632(ra) # 800046d4 <_ZL9fibonaccim>
    80004954:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004958:	00005517          	auipc	a0,0x5
    8000495c:	80050513          	addi	a0,a0,-2048 # 80009158 <CONSOLE_STATUS+0x148>
    80004960:	00001097          	auipc	ra,0x1
    80004964:	bd8080e7          	jalr	-1064(ra) # 80005538 <_Z11printStringPKc>
    80004968:	00000613          	li	a2,0
    8000496c:	00a00593          	li	a1,10
    80004970:	0009051b          	sext.w	a0,s2
    80004974:	00001097          	auipc	ra,0x1
    80004978:	d74080e7          	jalr	-652(ra) # 800056e8 <_Z8printIntiii>
    8000497c:	00005517          	auipc	a0,0x5
    80004980:	9dc50513          	addi	a0,a0,-1572 # 80009358 <CONSOLE_STATUS+0x348>
    80004984:	00001097          	auipc	ra,0x1
    80004988:	bb4080e7          	jalr	-1100(ra) # 80005538 <_Z11printStringPKc>
    8000498c:	0400006f          	j	800049cc <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80004990:	00004517          	auipc	a0,0x4
    80004994:	7a850513          	addi	a0,a0,1960 # 80009138 <CONSOLE_STATUS+0x128>
    80004998:	00001097          	auipc	ra,0x1
    8000499c:	ba0080e7          	jalr	-1120(ra) # 80005538 <_Z11printStringPKc>
    800049a0:	00000613          	li	a2,0
    800049a4:	00a00593          	li	a1,10
    800049a8:	00048513          	mv	a0,s1
    800049ac:	00001097          	auipc	ra,0x1
    800049b0:	d3c080e7          	jalr	-708(ra) # 800056e8 <_Z8printIntiii>
    800049b4:	00005517          	auipc	a0,0x5
    800049b8:	9a450513          	addi	a0,a0,-1628 # 80009358 <CONSOLE_STATUS+0x348>
    800049bc:	00001097          	auipc	ra,0x1
    800049c0:	b7c080e7          	jalr	-1156(ra) # 80005538 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800049c4:	0014849b          	addiw	s1,s1,1
    800049c8:	0ff4f493          	andi	s1,s1,255
    800049cc:	00500793          	li	a5,5
    800049d0:	fc97f0e3          	bgeu	a5,s1,80004990 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    800049d4:	00004517          	auipc	a0,0x4
    800049d8:	73c50513          	addi	a0,a0,1852 # 80009110 <CONSOLE_STATUS+0x100>
    800049dc:	00001097          	auipc	ra,0x1
    800049e0:	b5c080e7          	jalr	-1188(ra) # 80005538 <_Z11printStringPKc>
    finishedC = true;
    800049e4:	00100793          	li	a5,1
    800049e8:	00007717          	auipc	a4,0x7
    800049ec:	eaf700a3          	sb	a5,-351(a4) # 8000b889 <_ZL9finishedC>
    thread_dispatch();
    800049f0:	ffffd097          	auipc	ra,0xffffd
    800049f4:	b1c080e7          	jalr	-1252(ra) # 8000150c <_Z15thread_dispatchv>
}
    800049f8:	01813083          	ld	ra,24(sp)
    800049fc:	01013403          	ld	s0,16(sp)
    80004a00:	00813483          	ld	s1,8(sp)
    80004a04:	00013903          	ld	s2,0(sp)
    80004a08:	02010113          	addi	sp,sp,32
    80004a0c:	00008067          	ret

0000000080004a10 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80004a10:	fe010113          	addi	sp,sp,-32
    80004a14:	00113c23          	sd	ra,24(sp)
    80004a18:	00813823          	sd	s0,16(sp)
    80004a1c:	00913423          	sd	s1,8(sp)
    80004a20:	01213023          	sd	s2,0(sp)
    80004a24:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004a28:	00000913          	li	s2,0
    80004a2c:	0380006f          	j	80004a64 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80004a30:	ffffd097          	auipc	ra,0xffffd
    80004a34:	adc080e7          	jalr	-1316(ra) # 8000150c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004a38:	00148493          	addi	s1,s1,1
    80004a3c:	000027b7          	lui	a5,0x2
    80004a40:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004a44:	0097ee63          	bltu	a5,s1,80004a60 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004a48:	00000713          	li	a4,0
    80004a4c:	000077b7          	lui	a5,0x7
    80004a50:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004a54:	fce7eee3          	bltu	a5,a4,80004a30 <_ZL11workerBodyBPv+0x20>
    80004a58:	00170713          	addi	a4,a4,1
    80004a5c:	ff1ff06f          	j	80004a4c <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80004a60:	00190913          	addi	s2,s2,1
    80004a64:	00f00793          	li	a5,15
    80004a68:	0527e063          	bltu	a5,s2,80004aa8 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80004a6c:	00004517          	auipc	a0,0x4
    80004a70:	6b450513          	addi	a0,a0,1716 # 80009120 <CONSOLE_STATUS+0x110>
    80004a74:	00001097          	auipc	ra,0x1
    80004a78:	ac4080e7          	jalr	-1340(ra) # 80005538 <_Z11printStringPKc>
    80004a7c:	00000613          	li	a2,0
    80004a80:	00a00593          	li	a1,10
    80004a84:	0009051b          	sext.w	a0,s2
    80004a88:	00001097          	auipc	ra,0x1
    80004a8c:	c60080e7          	jalr	-928(ra) # 800056e8 <_Z8printIntiii>
    80004a90:	00005517          	auipc	a0,0x5
    80004a94:	8c850513          	addi	a0,a0,-1848 # 80009358 <CONSOLE_STATUS+0x348>
    80004a98:	00001097          	auipc	ra,0x1
    80004a9c:	aa0080e7          	jalr	-1376(ra) # 80005538 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004aa0:	00000493          	li	s1,0
    80004aa4:	f99ff06f          	j	80004a3c <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80004aa8:	00004517          	auipc	a0,0x4
    80004aac:	68050513          	addi	a0,a0,1664 # 80009128 <CONSOLE_STATUS+0x118>
    80004ab0:	00001097          	auipc	ra,0x1
    80004ab4:	a88080e7          	jalr	-1400(ra) # 80005538 <_Z11printStringPKc>
    finishedB = true;
    80004ab8:	00100793          	li	a5,1
    80004abc:	00007717          	auipc	a4,0x7
    80004ac0:	dcf70723          	sb	a5,-562(a4) # 8000b88a <_ZL9finishedB>
    thread_dispatch();
    80004ac4:	ffffd097          	auipc	ra,0xffffd
    80004ac8:	a48080e7          	jalr	-1464(ra) # 8000150c <_Z15thread_dispatchv>
}
    80004acc:	01813083          	ld	ra,24(sp)
    80004ad0:	01013403          	ld	s0,16(sp)
    80004ad4:	00813483          	ld	s1,8(sp)
    80004ad8:	00013903          	ld	s2,0(sp)
    80004adc:	02010113          	addi	sp,sp,32
    80004ae0:	00008067          	ret

0000000080004ae4 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80004ae4:	fe010113          	addi	sp,sp,-32
    80004ae8:	00113c23          	sd	ra,24(sp)
    80004aec:	00813823          	sd	s0,16(sp)
    80004af0:	00913423          	sd	s1,8(sp)
    80004af4:	01213023          	sd	s2,0(sp)
    80004af8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80004afc:	00000913          	li	s2,0
    80004b00:	0380006f          	j	80004b38 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80004b04:	ffffd097          	auipc	ra,0xffffd
    80004b08:	a08080e7          	jalr	-1528(ra) # 8000150c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004b0c:	00148493          	addi	s1,s1,1
    80004b10:	000027b7          	lui	a5,0x2
    80004b14:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004b18:	0097ee63          	bltu	a5,s1,80004b34 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004b1c:	00000713          	li	a4,0
    80004b20:	000077b7          	lui	a5,0x7
    80004b24:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004b28:	fce7eee3          	bltu	a5,a4,80004b04 <_ZL11workerBodyAPv+0x20>
    80004b2c:	00170713          	addi	a4,a4,1
    80004b30:	ff1ff06f          	j	80004b20 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80004b34:	00190913          	addi	s2,s2,1
    80004b38:	00900793          	li	a5,9
    80004b3c:	0527e063          	bltu	a5,s2,80004b7c <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80004b40:	00004517          	auipc	a0,0x4
    80004b44:	5c850513          	addi	a0,a0,1480 # 80009108 <CONSOLE_STATUS+0xf8>
    80004b48:	00001097          	auipc	ra,0x1
    80004b4c:	9f0080e7          	jalr	-1552(ra) # 80005538 <_Z11printStringPKc>
    80004b50:	00000613          	li	a2,0
    80004b54:	00a00593          	li	a1,10
    80004b58:	0009051b          	sext.w	a0,s2
    80004b5c:	00001097          	auipc	ra,0x1
    80004b60:	b8c080e7          	jalr	-1140(ra) # 800056e8 <_Z8printIntiii>
    80004b64:	00004517          	auipc	a0,0x4
    80004b68:	7f450513          	addi	a0,a0,2036 # 80009358 <CONSOLE_STATUS+0x348>
    80004b6c:	00001097          	auipc	ra,0x1
    80004b70:	9cc080e7          	jalr	-1588(ra) # 80005538 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004b74:	00000493          	li	s1,0
    80004b78:	f99ff06f          	j	80004b10 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80004b7c:	00004517          	auipc	a0,0x4
    80004b80:	59450513          	addi	a0,a0,1428 # 80009110 <CONSOLE_STATUS+0x100>
    80004b84:	00001097          	auipc	ra,0x1
    80004b88:	9b4080e7          	jalr	-1612(ra) # 80005538 <_Z11printStringPKc>
    finishedA = true;
    80004b8c:	00100793          	li	a5,1
    80004b90:	00007717          	auipc	a4,0x7
    80004b94:	cef70da3          	sb	a5,-773(a4) # 8000b88b <_ZL9finishedA>
}
    80004b98:	01813083          	ld	ra,24(sp)
    80004b9c:	01013403          	ld	s0,16(sp)
    80004ba0:	00813483          	ld	s1,8(sp)
    80004ba4:	00013903          	ld	s2,0(sp)
    80004ba8:	02010113          	addi	sp,sp,32
    80004bac:	00008067          	ret

0000000080004bb0 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80004bb0:	fd010113          	addi	sp,sp,-48
    80004bb4:	02113423          	sd	ra,40(sp)
    80004bb8:	02813023          	sd	s0,32(sp)
    80004bbc:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80004bc0:	00000613          	li	a2,0
    80004bc4:	00000597          	auipc	a1,0x0
    80004bc8:	f2058593          	addi	a1,a1,-224 # 80004ae4 <_ZL11workerBodyAPv>
    80004bcc:	fd040513          	addi	a0,s0,-48
    80004bd0:	ffffd097          	auipc	ra,0xffffd
    80004bd4:	858080e7          	jalr	-1960(ra) # 80001428 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80004bd8:	00004517          	auipc	a0,0x4
    80004bdc:	5c850513          	addi	a0,a0,1480 # 800091a0 <CONSOLE_STATUS+0x190>
    80004be0:	00001097          	auipc	ra,0x1
    80004be4:	958080e7          	jalr	-1704(ra) # 80005538 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80004be8:	00000613          	li	a2,0
    80004bec:	00000597          	auipc	a1,0x0
    80004bf0:	e2458593          	addi	a1,a1,-476 # 80004a10 <_ZL11workerBodyBPv>
    80004bf4:	fd840513          	addi	a0,s0,-40
    80004bf8:	ffffd097          	auipc	ra,0xffffd
    80004bfc:	830080e7          	jalr	-2000(ra) # 80001428 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80004c00:	00004517          	auipc	a0,0x4
    80004c04:	5b850513          	addi	a0,a0,1464 # 800091b8 <CONSOLE_STATUS+0x1a8>
    80004c08:	00001097          	auipc	ra,0x1
    80004c0c:	930080e7          	jalr	-1744(ra) # 80005538 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80004c10:	00000613          	li	a2,0
    80004c14:	00000597          	auipc	a1,0x0
    80004c18:	c7c58593          	addi	a1,a1,-900 # 80004890 <_ZL11workerBodyCPv>
    80004c1c:	fe040513          	addi	a0,s0,-32
    80004c20:	ffffd097          	auipc	ra,0xffffd
    80004c24:	808080e7          	jalr	-2040(ra) # 80001428 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80004c28:	00004517          	auipc	a0,0x4
    80004c2c:	5a850513          	addi	a0,a0,1448 # 800091d0 <CONSOLE_STATUS+0x1c0>
    80004c30:	00001097          	auipc	ra,0x1
    80004c34:	908080e7          	jalr	-1784(ra) # 80005538 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80004c38:	00000613          	li	a2,0
    80004c3c:	00000597          	auipc	a1,0x0
    80004c40:	b0c58593          	addi	a1,a1,-1268 # 80004748 <_ZL11workerBodyDPv>
    80004c44:	fe840513          	addi	a0,s0,-24
    80004c48:	ffffc097          	auipc	ra,0xffffc
    80004c4c:	7e0080e7          	jalr	2016(ra) # 80001428 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80004c50:	00004517          	auipc	a0,0x4
    80004c54:	59850513          	addi	a0,a0,1432 # 800091e8 <CONSOLE_STATUS+0x1d8>
    80004c58:	00001097          	auipc	ra,0x1
    80004c5c:	8e0080e7          	jalr	-1824(ra) # 80005538 <_Z11printStringPKc>
    80004c60:	00c0006f          	j	80004c6c <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80004c64:	ffffd097          	auipc	ra,0xffffd
    80004c68:	8a8080e7          	jalr	-1880(ra) # 8000150c <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004c6c:	00007797          	auipc	a5,0x7
    80004c70:	c1f7c783          	lbu	a5,-993(a5) # 8000b88b <_ZL9finishedA>
    80004c74:	fe0788e3          	beqz	a5,80004c64 <_Z18Threads_C_API_testv+0xb4>
    80004c78:	00007797          	auipc	a5,0x7
    80004c7c:	c127c783          	lbu	a5,-1006(a5) # 8000b88a <_ZL9finishedB>
    80004c80:	fe0782e3          	beqz	a5,80004c64 <_Z18Threads_C_API_testv+0xb4>
    80004c84:	00007797          	auipc	a5,0x7
    80004c88:	c057c783          	lbu	a5,-1019(a5) # 8000b889 <_ZL9finishedC>
    80004c8c:	fc078ce3          	beqz	a5,80004c64 <_Z18Threads_C_API_testv+0xb4>
    80004c90:	00007797          	auipc	a5,0x7
    80004c94:	bf87c783          	lbu	a5,-1032(a5) # 8000b888 <_ZL9finishedD>
    80004c98:	fc0786e3          	beqz	a5,80004c64 <_Z18Threads_C_API_testv+0xb4>
    }

}
    80004c9c:	02813083          	ld	ra,40(sp)
    80004ca0:	02013403          	ld	s0,32(sp)
    80004ca4:	03010113          	addi	sp,sp,48
    80004ca8:	00008067          	ret

0000000080004cac <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80004cac:	fd010113          	addi	sp,sp,-48
    80004cb0:	02113423          	sd	ra,40(sp)
    80004cb4:	02813023          	sd	s0,32(sp)
    80004cb8:	00913c23          	sd	s1,24(sp)
    80004cbc:	01213823          	sd	s2,16(sp)
    80004cc0:	01313423          	sd	s3,8(sp)
    80004cc4:	03010413          	addi	s0,sp,48
    80004cc8:	00050993          	mv	s3,a0
    80004ccc:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80004cd0:	00000913          	li	s2,0
    80004cd4:	00c0006f          	j	80004ce0 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80004cd8:	ffffd097          	auipc	ra,0xffffd
    80004cdc:	76c080e7          	jalr	1900(ra) # 80002444 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80004ce0:	ffffd097          	auipc	ra,0xffffd
    80004ce4:	a04080e7          	jalr	-1532(ra) # 800016e4 <_Z4getcv>
    80004ce8:	0005059b          	sext.w	a1,a0
    80004cec:	01b00793          	li	a5,27
    80004cf0:	02f58a63          	beq	a1,a5,80004d24 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80004cf4:	0084b503          	ld	a0,8(s1)
    80004cf8:	00001097          	auipc	ra,0x1
    80004cfc:	c64080e7          	jalr	-924(ra) # 8000595c <_ZN9BufferCPP3putEi>
        i++;
    80004d00:	0019071b          	addiw	a4,s2,1
    80004d04:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004d08:	0004a683          	lw	a3,0(s1)
    80004d0c:	0026979b          	slliw	a5,a3,0x2
    80004d10:	00d787bb          	addw	a5,a5,a3
    80004d14:	0017979b          	slliw	a5,a5,0x1
    80004d18:	02f767bb          	remw	a5,a4,a5
    80004d1c:	fc0792e3          	bnez	a5,80004ce0 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80004d20:	fb9ff06f          	j	80004cd8 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80004d24:	00100793          	li	a5,1
    80004d28:	00007717          	auipc	a4,0x7
    80004d2c:	b6f72423          	sw	a5,-1176(a4) # 8000b890 <_ZL9threadEnd>
    td->buffer->put('!');
    80004d30:	0209b783          	ld	a5,32(s3)
    80004d34:	02100593          	li	a1,33
    80004d38:	0087b503          	ld	a0,8(a5)
    80004d3c:	00001097          	auipc	ra,0x1
    80004d40:	c20080e7          	jalr	-992(ra) # 8000595c <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80004d44:	0104b503          	ld	a0,16(s1)
    80004d48:	ffffd097          	auipc	ra,0xffffd
    80004d4c:	7f4080e7          	jalr	2036(ra) # 8000253c <_ZN9Semaphore6signalEv>
}
    80004d50:	02813083          	ld	ra,40(sp)
    80004d54:	02013403          	ld	s0,32(sp)
    80004d58:	01813483          	ld	s1,24(sp)
    80004d5c:	01013903          	ld	s2,16(sp)
    80004d60:	00813983          	ld	s3,8(sp)
    80004d64:	03010113          	addi	sp,sp,48
    80004d68:	00008067          	ret

0000000080004d6c <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80004d6c:	fe010113          	addi	sp,sp,-32
    80004d70:	00113c23          	sd	ra,24(sp)
    80004d74:	00813823          	sd	s0,16(sp)
    80004d78:	00913423          	sd	s1,8(sp)
    80004d7c:	01213023          	sd	s2,0(sp)
    80004d80:	02010413          	addi	s0,sp,32
    80004d84:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80004d88:	00000913          	li	s2,0
    80004d8c:	00c0006f          	j	80004d98 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80004d90:	ffffd097          	auipc	ra,0xffffd
    80004d94:	6b4080e7          	jalr	1716(ra) # 80002444 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80004d98:	00007797          	auipc	a5,0x7
    80004d9c:	af87a783          	lw	a5,-1288(a5) # 8000b890 <_ZL9threadEnd>
    80004da0:	02079e63          	bnez	a5,80004ddc <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80004da4:	0004a583          	lw	a1,0(s1)
    80004da8:	0305859b          	addiw	a1,a1,48
    80004dac:	0084b503          	ld	a0,8(s1)
    80004db0:	00001097          	auipc	ra,0x1
    80004db4:	bac080e7          	jalr	-1108(ra) # 8000595c <_ZN9BufferCPP3putEi>
        i++;
    80004db8:	0019071b          	addiw	a4,s2,1
    80004dbc:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004dc0:	0004a683          	lw	a3,0(s1)
    80004dc4:	0026979b          	slliw	a5,a3,0x2
    80004dc8:	00d787bb          	addw	a5,a5,a3
    80004dcc:	0017979b          	slliw	a5,a5,0x1
    80004dd0:	02f767bb          	remw	a5,a4,a5
    80004dd4:	fc0792e3          	bnez	a5,80004d98 <_ZN12ProducerSync8producerEPv+0x2c>
    80004dd8:	fb9ff06f          	j	80004d90 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80004ddc:	0104b503          	ld	a0,16(s1)
    80004de0:	ffffd097          	auipc	ra,0xffffd
    80004de4:	75c080e7          	jalr	1884(ra) # 8000253c <_ZN9Semaphore6signalEv>
}
    80004de8:	01813083          	ld	ra,24(sp)
    80004dec:	01013403          	ld	s0,16(sp)
    80004df0:	00813483          	ld	s1,8(sp)
    80004df4:	00013903          	ld	s2,0(sp)
    80004df8:	02010113          	addi	sp,sp,32
    80004dfc:	00008067          	ret

0000000080004e00 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80004e00:	fd010113          	addi	sp,sp,-48
    80004e04:	02113423          	sd	ra,40(sp)
    80004e08:	02813023          	sd	s0,32(sp)
    80004e0c:	00913c23          	sd	s1,24(sp)
    80004e10:	01213823          	sd	s2,16(sp)
    80004e14:	01313423          	sd	s3,8(sp)
    80004e18:	01413023          	sd	s4,0(sp)
    80004e1c:	03010413          	addi	s0,sp,48
    80004e20:	00050993          	mv	s3,a0
    80004e24:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80004e28:	00000a13          	li	s4,0
    80004e2c:	01c0006f          	j	80004e48 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80004e30:	ffffd097          	auipc	ra,0xffffd
    80004e34:	614080e7          	jalr	1556(ra) # 80002444 <_ZN6Thread8dispatchEv>
    80004e38:	0500006f          	j	80004e88 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80004e3c:	00a00513          	li	a0,10
    80004e40:	ffffd097          	auipc	ra,0xffffd
    80004e44:	8e0080e7          	jalr	-1824(ra) # 80001720 <_Z4putcc>
    while (!threadEnd) {
    80004e48:	00007797          	auipc	a5,0x7
    80004e4c:	a487a783          	lw	a5,-1464(a5) # 8000b890 <_ZL9threadEnd>
    80004e50:	06079263          	bnez	a5,80004eb4 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80004e54:	00893503          	ld	a0,8(s2)
    80004e58:	00001097          	auipc	ra,0x1
    80004e5c:	b94080e7          	jalr	-1132(ra) # 800059ec <_ZN9BufferCPP3getEv>
        i++;
    80004e60:	001a049b          	addiw	s1,s4,1
    80004e64:	00048a1b          	sext.w	s4,s1
        putc(key);
    80004e68:	0ff57513          	andi	a0,a0,255
    80004e6c:	ffffd097          	auipc	ra,0xffffd
    80004e70:	8b4080e7          	jalr	-1868(ra) # 80001720 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80004e74:	00092703          	lw	a4,0(s2)
    80004e78:	0027179b          	slliw	a5,a4,0x2
    80004e7c:	00e787bb          	addw	a5,a5,a4
    80004e80:	02f4e7bb          	remw	a5,s1,a5
    80004e84:	fa0786e3          	beqz	a5,80004e30 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80004e88:	05000793          	li	a5,80
    80004e8c:	02f4e4bb          	remw	s1,s1,a5
    80004e90:	fa049ce3          	bnez	s1,80004e48 <_ZN12ConsumerSync8consumerEPv+0x48>
    80004e94:	fa9ff06f          	j	80004e3c <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80004e98:	0209b783          	ld	a5,32(s3)
    80004e9c:	0087b503          	ld	a0,8(a5)
    80004ea0:	00001097          	auipc	ra,0x1
    80004ea4:	b4c080e7          	jalr	-1204(ra) # 800059ec <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80004ea8:	0ff57513          	andi	a0,a0,255
    80004eac:	ffffd097          	auipc	ra,0xffffd
    80004eb0:	758080e7          	jalr	1880(ra) # 80002604 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80004eb4:	0209b783          	ld	a5,32(s3)
    80004eb8:	0087b503          	ld	a0,8(a5)
    80004ebc:	00001097          	auipc	ra,0x1
    80004ec0:	bbc080e7          	jalr	-1092(ra) # 80005a78 <_ZN9BufferCPP6getCntEv>
    80004ec4:	fca04ae3          	bgtz	a0,80004e98 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80004ec8:	01093503          	ld	a0,16(s2)
    80004ecc:	ffffd097          	auipc	ra,0xffffd
    80004ed0:	670080e7          	jalr	1648(ra) # 8000253c <_ZN9Semaphore6signalEv>
}
    80004ed4:	02813083          	ld	ra,40(sp)
    80004ed8:	02013403          	ld	s0,32(sp)
    80004edc:	01813483          	ld	s1,24(sp)
    80004ee0:	01013903          	ld	s2,16(sp)
    80004ee4:	00813983          	ld	s3,8(sp)
    80004ee8:	00013a03          	ld	s4,0(sp)
    80004eec:	03010113          	addi	sp,sp,48
    80004ef0:	00008067          	ret

0000000080004ef4 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80004ef4:	f8010113          	addi	sp,sp,-128
    80004ef8:	06113c23          	sd	ra,120(sp)
    80004efc:	06813823          	sd	s0,112(sp)
    80004f00:	06913423          	sd	s1,104(sp)
    80004f04:	07213023          	sd	s2,96(sp)
    80004f08:	05313c23          	sd	s3,88(sp)
    80004f0c:	05413823          	sd	s4,80(sp)
    80004f10:	05513423          	sd	s5,72(sp)
    80004f14:	05613023          	sd	s6,64(sp)
    80004f18:	03713c23          	sd	s7,56(sp)
    80004f1c:	03813823          	sd	s8,48(sp)
    80004f20:	03913423          	sd	s9,40(sp)
    80004f24:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80004f28:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80004f2c:	00004517          	auipc	a0,0x4
    80004f30:	0f450513          	addi	a0,a0,244 # 80009020 <CONSOLE_STATUS+0x10>
    80004f34:	00000097          	auipc	ra,0x0
    80004f38:	604080e7          	jalr	1540(ra) # 80005538 <_Z11printStringPKc>
    getString(input, 30);
    80004f3c:	01e00593          	li	a1,30
    80004f40:	f8040493          	addi	s1,s0,-128
    80004f44:	00048513          	mv	a0,s1
    80004f48:	00000097          	auipc	ra,0x0
    80004f4c:	678080e7          	jalr	1656(ra) # 800055c0 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004f50:	00048513          	mv	a0,s1
    80004f54:	00000097          	auipc	ra,0x0
    80004f58:	744080e7          	jalr	1860(ra) # 80005698 <_Z11stringToIntPKc>
    80004f5c:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80004f60:	00004517          	auipc	a0,0x4
    80004f64:	0e050513          	addi	a0,a0,224 # 80009040 <CONSOLE_STATUS+0x30>
    80004f68:	00000097          	auipc	ra,0x0
    80004f6c:	5d0080e7          	jalr	1488(ra) # 80005538 <_Z11printStringPKc>
    getString(input, 30);
    80004f70:	01e00593          	li	a1,30
    80004f74:	00048513          	mv	a0,s1
    80004f78:	00000097          	auipc	ra,0x0
    80004f7c:	648080e7          	jalr	1608(ra) # 800055c0 <_Z9getStringPci>
    n = stringToInt(input);
    80004f80:	00048513          	mv	a0,s1
    80004f84:	00000097          	auipc	ra,0x0
    80004f88:	714080e7          	jalr	1812(ra) # 80005698 <_Z11stringToIntPKc>
    80004f8c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80004f90:	00004517          	auipc	a0,0x4
    80004f94:	0d050513          	addi	a0,a0,208 # 80009060 <CONSOLE_STATUS+0x50>
    80004f98:	00000097          	auipc	ra,0x0
    80004f9c:	5a0080e7          	jalr	1440(ra) # 80005538 <_Z11printStringPKc>
    80004fa0:	00000613          	li	a2,0
    80004fa4:	00a00593          	li	a1,10
    80004fa8:	00090513          	mv	a0,s2
    80004fac:	00000097          	auipc	ra,0x0
    80004fb0:	73c080e7          	jalr	1852(ra) # 800056e8 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80004fb4:	00004517          	auipc	a0,0x4
    80004fb8:	0c450513          	addi	a0,a0,196 # 80009078 <CONSOLE_STATUS+0x68>
    80004fbc:	00000097          	auipc	ra,0x0
    80004fc0:	57c080e7          	jalr	1404(ra) # 80005538 <_Z11printStringPKc>
    80004fc4:	00000613          	li	a2,0
    80004fc8:	00a00593          	li	a1,10
    80004fcc:	00048513          	mv	a0,s1
    80004fd0:	00000097          	auipc	ra,0x0
    80004fd4:	718080e7          	jalr	1816(ra) # 800056e8 <_Z8printIntiii>
    printString(".\n");
    80004fd8:	00004517          	auipc	a0,0x4
    80004fdc:	0b850513          	addi	a0,a0,184 # 80009090 <CONSOLE_STATUS+0x80>
    80004fe0:	00000097          	auipc	ra,0x0
    80004fe4:	558080e7          	jalr	1368(ra) # 80005538 <_Z11printStringPKc>
    if(threadNum > n) {
    80004fe8:	0324c463          	blt	s1,s2,80005010 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80004fec:	03205c63          	blez	s2,80005024 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80004ff0:	03800513          	li	a0,56
    80004ff4:	ffffd097          	auipc	ra,0xffffd
    80004ff8:	298080e7          	jalr	664(ra) # 8000228c <_Znwm>
    80004ffc:	00050a93          	mv	s5,a0
    80005000:	00048593          	mv	a1,s1
    80005004:	00001097          	auipc	ra,0x1
    80005008:	804080e7          	jalr	-2044(ra) # 80005808 <_ZN9BufferCPPC1Ei>
    8000500c:	0300006f          	j	8000503c <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80005010:	00004517          	auipc	a0,0x4
    80005014:	08850513          	addi	a0,a0,136 # 80009098 <CONSOLE_STATUS+0x88>
    80005018:	00000097          	auipc	ra,0x0
    8000501c:	520080e7          	jalr	1312(ra) # 80005538 <_Z11printStringPKc>
        return;
    80005020:	0140006f          	j	80005034 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005024:	00004517          	auipc	a0,0x4
    80005028:	0b450513          	addi	a0,a0,180 # 800090d8 <CONSOLE_STATUS+0xc8>
    8000502c:	00000097          	auipc	ra,0x0
    80005030:	50c080e7          	jalr	1292(ra) # 80005538 <_Z11printStringPKc>
        return;
    80005034:	000b8113          	mv	sp,s7
    80005038:	2380006f          	j	80005270 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    8000503c:	01000513          	li	a0,16
    80005040:	ffffd097          	auipc	ra,0xffffd
    80005044:	24c080e7          	jalr	588(ra) # 8000228c <_Znwm>
    80005048:	00050493          	mv	s1,a0
    8000504c:	00000593          	li	a1,0
    80005050:	ffffd097          	auipc	ra,0xffffd
    80005054:	488080e7          	jalr	1160(ra) # 800024d8 <_ZN9SemaphoreC1Ej>
    80005058:	00007797          	auipc	a5,0x7
    8000505c:	8497b023          	sd	s1,-1984(a5) # 8000b898 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80005060:	00391793          	slli	a5,s2,0x3
    80005064:	00f78793          	addi	a5,a5,15
    80005068:	ff07f793          	andi	a5,a5,-16
    8000506c:	40f10133          	sub	sp,sp,a5
    80005070:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80005074:	0019071b          	addiw	a4,s2,1
    80005078:	00171793          	slli	a5,a4,0x1
    8000507c:	00e787b3          	add	a5,a5,a4
    80005080:	00379793          	slli	a5,a5,0x3
    80005084:	00f78793          	addi	a5,a5,15
    80005088:	ff07f793          	andi	a5,a5,-16
    8000508c:	40f10133          	sub	sp,sp,a5
    80005090:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80005094:	00191c13          	slli	s8,s2,0x1
    80005098:	012c07b3          	add	a5,s8,s2
    8000509c:	00379793          	slli	a5,a5,0x3
    800050a0:	00fa07b3          	add	a5,s4,a5
    800050a4:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800050a8:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    800050ac:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    800050b0:	02800513          	li	a0,40
    800050b4:	ffffd097          	auipc	ra,0xffffd
    800050b8:	1d8080e7          	jalr	472(ra) # 8000228c <_Znwm>
    800050bc:	00050b13          	mv	s6,a0
    800050c0:	012c0c33          	add	s8,s8,s2
    800050c4:	003c1c13          	slli	s8,s8,0x3
    800050c8:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    800050cc:	ffffd097          	auipc	ra,0xffffd
    800050d0:	3c8080e7          	jalr	968(ra) # 80002494 <_ZN6ThreadC1Ev>
    800050d4:	00006797          	auipc	a5,0x6
    800050d8:	65478793          	addi	a5,a5,1620 # 8000b728 <_ZTV12ConsumerSync+0x10>
    800050dc:	00fb3023          	sd	a5,0(s6)
    800050e0:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    800050e4:	000b0513          	mv	a0,s6
    800050e8:	ffffd097          	auipc	ra,0xffffd
    800050ec:	2ec080e7          	jalr	748(ra) # 800023d4 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    800050f0:	00000493          	li	s1,0
    800050f4:	0380006f          	j	8000512c <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800050f8:	00006797          	auipc	a5,0x6
    800050fc:	60878793          	addi	a5,a5,1544 # 8000b700 <_ZTV12ProducerSync+0x10>
    80005100:	00fcb023          	sd	a5,0(s9)
    80005104:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80005108:	00349793          	slli	a5,s1,0x3
    8000510c:	00f987b3          	add	a5,s3,a5
    80005110:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80005114:	00349793          	slli	a5,s1,0x3
    80005118:	00f987b3          	add	a5,s3,a5
    8000511c:	0007b503          	ld	a0,0(a5)
    80005120:	ffffd097          	auipc	ra,0xffffd
    80005124:	2b4080e7          	jalr	692(ra) # 800023d4 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005128:	0014849b          	addiw	s1,s1,1
    8000512c:	0b24d063          	bge	s1,s2,800051cc <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80005130:	00149793          	slli	a5,s1,0x1
    80005134:	009787b3          	add	a5,a5,s1
    80005138:	00379793          	slli	a5,a5,0x3
    8000513c:	00fa07b3          	add	a5,s4,a5
    80005140:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80005144:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80005148:	00006717          	auipc	a4,0x6
    8000514c:	75073703          	ld	a4,1872(a4) # 8000b898 <_ZL10waitForAll>
    80005150:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80005154:	02905863          	blez	s1,80005184 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80005158:	02800513          	li	a0,40
    8000515c:	ffffd097          	auipc	ra,0xffffd
    80005160:	130080e7          	jalr	304(ra) # 8000228c <_Znwm>
    80005164:	00050c93          	mv	s9,a0
    80005168:	00149c13          	slli	s8,s1,0x1
    8000516c:	009c0c33          	add	s8,s8,s1
    80005170:	003c1c13          	slli	s8,s8,0x3
    80005174:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005178:	ffffd097          	auipc	ra,0xffffd
    8000517c:	31c080e7          	jalr	796(ra) # 80002494 <_ZN6ThreadC1Ev>
    80005180:	f79ff06f          	j	800050f8 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80005184:	02800513          	li	a0,40
    80005188:	ffffd097          	auipc	ra,0xffffd
    8000518c:	104080e7          	jalr	260(ra) # 8000228c <_Znwm>
    80005190:	00050c93          	mv	s9,a0
    80005194:	00149c13          	slli	s8,s1,0x1
    80005198:	009c0c33          	add	s8,s8,s1
    8000519c:	003c1c13          	slli	s8,s8,0x3
    800051a0:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    800051a4:	ffffd097          	auipc	ra,0xffffd
    800051a8:	2f0080e7          	jalr	752(ra) # 80002494 <_ZN6ThreadC1Ev>
    800051ac:	00006797          	auipc	a5,0x6
    800051b0:	52c78793          	addi	a5,a5,1324 # 8000b6d8 <_ZTV16ProducerKeyboard+0x10>
    800051b4:	00fcb023          	sd	a5,0(s9)
    800051b8:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    800051bc:	00349793          	slli	a5,s1,0x3
    800051c0:	00f987b3          	add	a5,s3,a5
    800051c4:	0197b023          	sd	s9,0(a5)
    800051c8:	f4dff06f          	j	80005114 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    800051cc:	ffffd097          	auipc	ra,0xffffd
    800051d0:	278080e7          	jalr	632(ra) # 80002444 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    800051d4:	00000493          	li	s1,0
    800051d8:	00994e63          	blt	s2,s1,800051f4 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    800051dc:	00006517          	auipc	a0,0x6
    800051e0:	6bc53503          	ld	a0,1724(a0) # 8000b898 <_ZL10waitForAll>
    800051e4:	ffffd097          	auipc	ra,0xffffd
    800051e8:	32c080e7          	jalr	812(ra) # 80002510 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    800051ec:	0014849b          	addiw	s1,s1,1
    800051f0:	fe9ff06f          	j	800051d8 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    800051f4:	00000493          	li	s1,0
    800051f8:	0080006f          	j	80005200 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    800051fc:	0014849b          	addiw	s1,s1,1
    80005200:	0324d263          	bge	s1,s2,80005224 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80005204:	00349793          	slli	a5,s1,0x3
    80005208:	00f987b3          	add	a5,s3,a5
    8000520c:	0007b503          	ld	a0,0(a5)
    80005210:	fe0506e3          	beqz	a0,800051fc <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80005214:	00053783          	ld	a5,0(a0)
    80005218:	0087b783          	ld	a5,8(a5)
    8000521c:	000780e7          	jalr	a5
    80005220:	fddff06f          	j	800051fc <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80005224:	000b0a63          	beqz	s6,80005238 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80005228:	000b3783          	ld	a5,0(s6)
    8000522c:	0087b783          	ld	a5,8(a5)
    80005230:	000b0513          	mv	a0,s6
    80005234:	000780e7          	jalr	a5
    delete waitForAll;
    80005238:	00006517          	auipc	a0,0x6
    8000523c:	66053503          	ld	a0,1632(a0) # 8000b898 <_ZL10waitForAll>
    80005240:	00050863          	beqz	a0,80005250 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80005244:	00053783          	ld	a5,0(a0)
    80005248:	0087b783          	ld	a5,8(a5)
    8000524c:	000780e7          	jalr	a5
    delete buffer;
    80005250:	000a8e63          	beqz	s5,8000526c <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80005254:	000a8513          	mv	a0,s5
    80005258:	00001097          	auipc	ra,0x1
    8000525c:	8a8080e7          	jalr	-1880(ra) # 80005b00 <_ZN9BufferCPPD1Ev>
    80005260:	000a8513          	mv	a0,s5
    80005264:	ffffd097          	auipc	ra,0xffffd
    80005268:	050080e7          	jalr	80(ra) # 800022b4 <_ZdlPv>
    8000526c:	000b8113          	mv	sp,s7

}
    80005270:	f8040113          	addi	sp,s0,-128
    80005274:	07813083          	ld	ra,120(sp)
    80005278:	07013403          	ld	s0,112(sp)
    8000527c:	06813483          	ld	s1,104(sp)
    80005280:	06013903          	ld	s2,96(sp)
    80005284:	05813983          	ld	s3,88(sp)
    80005288:	05013a03          	ld	s4,80(sp)
    8000528c:	04813a83          	ld	s5,72(sp)
    80005290:	04013b03          	ld	s6,64(sp)
    80005294:	03813b83          	ld	s7,56(sp)
    80005298:	03013c03          	ld	s8,48(sp)
    8000529c:	02813c83          	ld	s9,40(sp)
    800052a0:	08010113          	addi	sp,sp,128
    800052a4:	00008067          	ret
    800052a8:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    800052ac:	000a8513          	mv	a0,s5
    800052b0:	ffffd097          	auipc	ra,0xffffd
    800052b4:	004080e7          	jalr	4(ra) # 800022b4 <_ZdlPv>
    800052b8:	00048513          	mv	a0,s1
    800052bc:	00007097          	auipc	ra,0x7
    800052c0:	6bc080e7          	jalr	1724(ra) # 8000c978 <_Unwind_Resume>
    800052c4:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    800052c8:	00048513          	mv	a0,s1
    800052cc:	ffffd097          	auipc	ra,0xffffd
    800052d0:	fe8080e7          	jalr	-24(ra) # 800022b4 <_ZdlPv>
    800052d4:	00090513          	mv	a0,s2
    800052d8:	00007097          	auipc	ra,0x7
    800052dc:	6a0080e7          	jalr	1696(ra) # 8000c978 <_Unwind_Resume>
    800052e0:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    800052e4:	000b0513          	mv	a0,s6
    800052e8:	ffffd097          	auipc	ra,0xffffd
    800052ec:	fcc080e7          	jalr	-52(ra) # 800022b4 <_ZdlPv>
    800052f0:	00048513          	mv	a0,s1
    800052f4:	00007097          	auipc	ra,0x7
    800052f8:	684080e7          	jalr	1668(ra) # 8000c978 <_Unwind_Resume>
    800052fc:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80005300:	000c8513          	mv	a0,s9
    80005304:	ffffd097          	auipc	ra,0xffffd
    80005308:	fb0080e7          	jalr	-80(ra) # 800022b4 <_ZdlPv>
    8000530c:	00048513          	mv	a0,s1
    80005310:	00007097          	auipc	ra,0x7
    80005314:	668080e7          	jalr	1640(ra) # 8000c978 <_Unwind_Resume>
    80005318:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    8000531c:	000c8513          	mv	a0,s9
    80005320:	ffffd097          	auipc	ra,0xffffd
    80005324:	f94080e7          	jalr	-108(ra) # 800022b4 <_ZdlPv>
    80005328:	00048513          	mv	a0,s1
    8000532c:	00007097          	auipc	ra,0x7
    80005330:	64c080e7          	jalr	1612(ra) # 8000c978 <_Unwind_Resume>

0000000080005334 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005334:	ff010113          	addi	sp,sp,-16
    80005338:	00113423          	sd	ra,8(sp)
    8000533c:	00813023          	sd	s0,0(sp)
    80005340:	01010413          	addi	s0,sp,16
    80005344:	00006797          	auipc	a5,0x6
    80005348:	3e478793          	addi	a5,a5,996 # 8000b728 <_ZTV12ConsumerSync+0x10>
    8000534c:	00f53023          	sd	a5,0(a0)
    80005350:	ffffd097          	auipc	ra,0xffffd
    80005354:	f8c080e7          	jalr	-116(ra) # 800022dc <_ZN6ThreadD1Ev>
    80005358:	00813083          	ld	ra,8(sp)
    8000535c:	00013403          	ld	s0,0(sp)
    80005360:	01010113          	addi	sp,sp,16
    80005364:	00008067          	ret

0000000080005368 <_ZN12ConsumerSyncD0Ev>:
    80005368:	fe010113          	addi	sp,sp,-32
    8000536c:	00113c23          	sd	ra,24(sp)
    80005370:	00813823          	sd	s0,16(sp)
    80005374:	00913423          	sd	s1,8(sp)
    80005378:	02010413          	addi	s0,sp,32
    8000537c:	00050493          	mv	s1,a0
    80005380:	00006797          	auipc	a5,0x6
    80005384:	3a878793          	addi	a5,a5,936 # 8000b728 <_ZTV12ConsumerSync+0x10>
    80005388:	00f53023          	sd	a5,0(a0)
    8000538c:	ffffd097          	auipc	ra,0xffffd
    80005390:	f50080e7          	jalr	-176(ra) # 800022dc <_ZN6ThreadD1Ev>
    80005394:	00048513          	mv	a0,s1
    80005398:	ffffd097          	auipc	ra,0xffffd
    8000539c:	f1c080e7          	jalr	-228(ra) # 800022b4 <_ZdlPv>
    800053a0:	01813083          	ld	ra,24(sp)
    800053a4:	01013403          	ld	s0,16(sp)
    800053a8:	00813483          	ld	s1,8(sp)
    800053ac:	02010113          	addi	sp,sp,32
    800053b0:	00008067          	ret

00000000800053b4 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    800053b4:	ff010113          	addi	sp,sp,-16
    800053b8:	00113423          	sd	ra,8(sp)
    800053bc:	00813023          	sd	s0,0(sp)
    800053c0:	01010413          	addi	s0,sp,16
    800053c4:	00006797          	auipc	a5,0x6
    800053c8:	33c78793          	addi	a5,a5,828 # 8000b700 <_ZTV12ProducerSync+0x10>
    800053cc:	00f53023          	sd	a5,0(a0)
    800053d0:	ffffd097          	auipc	ra,0xffffd
    800053d4:	f0c080e7          	jalr	-244(ra) # 800022dc <_ZN6ThreadD1Ev>
    800053d8:	00813083          	ld	ra,8(sp)
    800053dc:	00013403          	ld	s0,0(sp)
    800053e0:	01010113          	addi	sp,sp,16
    800053e4:	00008067          	ret

00000000800053e8 <_ZN12ProducerSyncD0Ev>:
    800053e8:	fe010113          	addi	sp,sp,-32
    800053ec:	00113c23          	sd	ra,24(sp)
    800053f0:	00813823          	sd	s0,16(sp)
    800053f4:	00913423          	sd	s1,8(sp)
    800053f8:	02010413          	addi	s0,sp,32
    800053fc:	00050493          	mv	s1,a0
    80005400:	00006797          	auipc	a5,0x6
    80005404:	30078793          	addi	a5,a5,768 # 8000b700 <_ZTV12ProducerSync+0x10>
    80005408:	00f53023          	sd	a5,0(a0)
    8000540c:	ffffd097          	auipc	ra,0xffffd
    80005410:	ed0080e7          	jalr	-304(ra) # 800022dc <_ZN6ThreadD1Ev>
    80005414:	00048513          	mv	a0,s1
    80005418:	ffffd097          	auipc	ra,0xffffd
    8000541c:	e9c080e7          	jalr	-356(ra) # 800022b4 <_ZdlPv>
    80005420:	01813083          	ld	ra,24(sp)
    80005424:	01013403          	ld	s0,16(sp)
    80005428:	00813483          	ld	s1,8(sp)
    8000542c:	02010113          	addi	sp,sp,32
    80005430:	00008067          	ret

0000000080005434 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80005434:	ff010113          	addi	sp,sp,-16
    80005438:	00113423          	sd	ra,8(sp)
    8000543c:	00813023          	sd	s0,0(sp)
    80005440:	01010413          	addi	s0,sp,16
    80005444:	00006797          	auipc	a5,0x6
    80005448:	29478793          	addi	a5,a5,660 # 8000b6d8 <_ZTV16ProducerKeyboard+0x10>
    8000544c:	00f53023          	sd	a5,0(a0)
    80005450:	ffffd097          	auipc	ra,0xffffd
    80005454:	e8c080e7          	jalr	-372(ra) # 800022dc <_ZN6ThreadD1Ev>
    80005458:	00813083          	ld	ra,8(sp)
    8000545c:	00013403          	ld	s0,0(sp)
    80005460:	01010113          	addi	sp,sp,16
    80005464:	00008067          	ret

0000000080005468 <_ZN16ProducerKeyboardD0Ev>:
    80005468:	fe010113          	addi	sp,sp,-32
    8000546c:	00113c23          	sd	ra,24(sp)
    80005470:	00813823          	sd	s0,16(sp)
    80005474:	00913423          	sd	s1,8(sp)
    80005478:	02010413          	addi	s0,sp,32
    8000547c:	00050493          	mv	s1,a0
    80005480:	00006797          	auipc	a5,0x6
    80005484:	25878793          	addi	a5,a5,600 # 8000b6d8 <_ZTV16ProducerKeyboard+0x10>
    80005488:	00f53023          	sd	a5,0(a0)
    8000548c:	ffffd097          	auipc	ra,0xffffd
    80005490:	e50080e7          	jalr	-432(ra) # 800022dc <_ZN6ThreadD1Ev>
    80005494:	00048513          	mv	a0,s1
    80005498:	ffffd097          	auipc	ra,0xffffd
    8000549c:	e1c080e7          	jalr	-484(ra) # 800022b4 <_ZdlPv>
    800054a0:	01813083          	ld	ra,24(sp)
    800054a4:	01013403          	ld	s0,16(sp)
    800054a8:	00813483          	ld	s1,8(sp)
    800054ac:	02010113          	addi	sp,sp,32
    800054b0:	00008067          	ret

00000000800054b4 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    800054b4:	ff010113          	addi	sp,sp,-16
    800054b8:	00113423          	sd	ra,8(sp)
    800054bc:	00813023          	sd	s0,0(sp)
    800054c0:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    800054c4:	02053583          	ld	a1,32(a0)
    800054c8:	fffff097          	auipc	ra,0xfffff
    800054cc:	7e4080e7          	jalr	2020(ra) # 80004cac <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    800054d0:	00813083          	ld	ra,8(sp)
    800054d4:	00013403          	ld	s0,0(sp)
    800054d8:	01010113          	addi	sp,sp,16
    800054dc:	00008067          	ret

00000000800054e0 <_ZN12ProducerSync3runEv>:
    void run() override {
    800054e0:	ff010113          	addi	sp,sp,-16
    800054e4:	00113423          	sd	ra,8(sp)
    800054e8:	00813023          	sd	s0,0(sp)
    800054ec:	01010413          	addi	s0,sp,16
        producer(td);
    800054f0:	02053583          	ld	a1,32(a0)
    800054f4:	00000097          	auipc	ra,0x0
    800054f8:	878080e7          	jalr	-1928(ra) # 80004d6c <_ZN12ProducerSync8producerEPv>
    }
    800054fc:	00813083          	ld	ra,8(sp)
    80005500:	00013403          	ld	s0,0(sp)
    80005504:	01010113          	addi	sp,sp,16
    80005508:	00008067          	ret

000000008000550c <_ZN12ConsumerSync3runEv>:
    void run() override {
    8000550c:	ff010113          	addi	sp,sp,-16
    80005510:	00113423          	sd	ra,8(sp)
    80005514:	00813023          	sd	s0,0(sp)
    80005518:	01010413          	addi	s0,sp,16
        consumer(td);
    8000551c:	02053583          	ld	a1,32(a0)
    80005520:	00000097          	auipc	ra,0x0
    80005524:	8e0080e7          	jalr	-1824(ra) # 80004e00 <_ZN12ConsumerSync8consumerEPv>
    }
    80005528:	00813083          	ld	ra,8(sp)
    8000552c:	00013403          	ld	s0,0(sp)
    80005530:	01010113          	addi	sp,sp,16
    80005534:	00008067          	ret

0000000080005538 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80005538:	fe010113          	addi	sp,sp,-32
    8000553c:	00113c23          	sd	ra,24(sp)
    80005540:	00813823          	sd	s0,16(sp)
    80005544:	00913423          	sd	s1,8(sp)
    80005548:	02010413          	addi	s0,sp,32
    8000554c:	00050493          	mv	s1,a0
    LOCK();
    80005550:	00100613          	li	a2,1
    80005554:	00000593          	li	a1,0
    80005558:	00006517          	auipc	a0,0x6
    8000555c:	34850513          	addi	a0,a0,840 # 8000b8a0 <lockPrint>
    80005560:	ffffc097          	auipc	ra,0xffffc
    80005564:	e0c080e7          	jalr	-500(ra) # 8000136c <copy_and_swap>
    80005568:	00050863          	beqz	a0,80005578 <_Z11printStringPKc+0x40>
    8000556c:	ffffc097          	auipc	ra,0xffffc
    80005570:	fa0080e7          	jalr	-96(ra) # 8000150c <_Z15thread_dispatchv>
    80005574:	fddff06f          	j	80005550 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80005578:	0004c503          	lbu	a0,0(s1)
    8000557c:	00050a63          	beqz	a0,80005590 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005580:	ffffc097          	auipc	ra,0xffffc
    80005584:	1a0080e7          	jalr	416(ra) # 80001720 <_Z4putcc>
        string++;
    80005588:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    8000558c:	fedff06f          	j	80005578 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005590:	00000613          	li	a2,0
    80005594:	00100593          	li	a1,1
    80005598:	00006517          	auipc	a0,0x6
    8000559c:	30850513          	addi	a0,a0,776 # 8000b8a0 <lockPrint>
    800055a0:	ffffc097          	auipc	ra,0xffffc
    800055a4:	dcc080e7          	jalr	-564(ra) # 8000136c <copy_and_swap>
    800055a8:	fe0514e3          	bnez	a0,80005590 <_Z11printStringPKc+0x58>
}
    800055ac:	01813083          	ld	ra,24(sp)
    800055b0:	01013403          	ld	s0,16(sp)
    800055b4:	00813483          	ld	s1,8(sp)
    800055b8:	02010113          	addi	sp,sp,32
    800055bc:	00008067          	ret

00000000800055c0 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    800055c0:	fd010113          	addi	sp,sp,-48
    800055c4:	02113423          	sd	ra,40(sp)
    800055c8:	02813023          	sd	s0,32(sp)
    800055cc:	00913c23          	sd	s1,24(sp)
    800055d0:	01213823          	sd	s2,16(sp)
    800055d4:	01313423          	sd	s3,8(sp)
    800055d8:	01413023          	sd	s4,0(sp)
    800055dc:	03010413          	addi	s0,sp,48
    800055e0:	00050993          	mv	s3,a0
    800055e4:	00058a13          	mv	s4,a1
    LOCK();
    800055e8:	00100613          	li	a2,1
    800055ec:	00000593          	li	a1,0
    800055f0:	00006517          	auipc	a0,0x6
    800055f4:	2b050513          	addi	a0,a0,688 # 8000b8a0 <lockPrint>
    800055f8:	ffffc097          	auipc	ra,0xffffc
    800055fc:	d74080e7          	jalr	-652(ra) # 8000136c <copy_and_swap>
    80005600:	00050863          	beqz	a0,80005610 <_Z9getStringPci+0x50>
    80005604:	ffffc097          	auipc	ra,0xffffc
    80005608:	f08080e7          	jalr	-248(ra) # 8000150c <_Z15thread_dispatchv>
    8000560c:	fddff06f          	j	800055e8 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005610:	00000913          	li	s2,0
    80005614:	00090493          	mv	s1,s2
    80005618:	0019091b          	addiw	s2,s2,1
    8000561c:	03495a63          	bge	s2,s4,80005650 <_Z9getStringPci+0x90>
        cc = getc();
    80005620:	ffffc097          	auipc	ra,0xffffc
    80005624:	0c4080e7          	jalr	196(ra) # 800016e4 <_Z4getcv>
        if(cc < 1)
    80005628:	02050463          	beqz	a0,80005650 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    8000562c:	009984b3          	add	s1,s3,s1
    80005630:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005634:	00a00793          	li	a5,10
    80005638:	00f50a63          	beq	a0,a5,8000564c <_Z9getStringPci+0x8c>
    8000563c:	00d00793          	li	a5,13
    80005640:	fcf51ae3          	bne	a0,a5,80005614 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80005644:	00090493          	mv	s1,s2
    80005648:	0080006f          	j	80005650 <_Z9getStringPci+0x90>
    8000564c:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80005650:	009984b3          	add	s1,s3,s1
    80005654:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80005658:	00000613          	li	a2,0
    8000565c:	00100593          	li	a1,1
    80005660:	00006517          	auipc	a0,0x6
    80005664:	24050513          	addi	a0,a0,576 # 8000b8a0 <lockPrint>
    80005668:	ffffc097          	auipc	ra,0xffffc
    8000566c:	d04080e7          	jalr	-764(ra) # 8000136c <copy_and_swap>
    80005670:	fe0514e3          	bnez	a0,80005658 <_Z9getStringPci+0x98>
    return buf;
}
    80005674:	00098513          	mv	a0,s3
    80005678:	02813083          	ld	ra,40(sp)
    8000567c:	02013403          	ld	s0,32(sp)
    80005680:	01813483          	ld	s1,24(sp)
    80005684:	01013903          	ld	s2,16(sp)
    80005688:	00813983          	ld	s3,8(sp)
    8000568c:	00013a03          	ld	s4,0(sp)
    80005690:	03010113          	addi	sp,sp,48
    80005694:	00008067          	ret

0000000080005698 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80005698:	ff010113          	addi	sp,sp,-16
    8000569c:	00813423          	sd	s0,8(sp)
    800056a0:	01010413          	addi	s0,sp,16
    800056a4:	00050693          	mv	a3,a0
    int n;

    n = 0;
    800056a8:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    800056ac:	0006c603          	lbu	a2,0(a3)
    800056b0:	fd06071b          	addiw	a4,a2,-48
    800056b4:	0ff77713          	andi	a4,a4,255
    800056b8:	00900793          	li	a5,9
    800056bc:	02e7e063          	bltu	a5,a4,800056dc <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    800056c0:	0025179b          	slliw	a5,a0,0x2
    800056c4:	00a787bb          	addw	a5,a5,a0
    800056c8:	0017979b          	slliw	a5,a5,0x1
    800056cc:	00168693          	addi	a3,a3,1
    800056d0:	00c787bb          	addw	a5,a5,a2
    800056d4:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    800056d8:	fd5ff06f          	j	800056ac <_Z11stringToIntPKc+0x14>
    return n;
}
    800056dc:	00813403          	ld	s0,8(sp)
    800056e0:	01010113          	addi	sp,sp,16
    800056e4:	00008067          	ret

00000000800056e8 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    800056e8:	fc010113          	addi	sp,sp,-64
    800056ec:	02113c23          	sd	ra,56(sp)
    800056f0:	02813823          	sd	s0,48(sp)
    800056f4:	02913423          	sd	s1,40(sp)
    800056f8:	03213023          	sd	s2,32(sp)
    800056fc:	01313c23          	sd	s3,24(sp)
    80005700:	04010413          	addi	s0,sp,64
    80005704:	00050493          	mv	s1,a0
    80005708:	00058913          	mv	s2,a1
    8000570c:	00060993          	mv	s3,a2
    LOCK();
    80005710:	00100613          	li	a2,1
    80005714:	00000593          	li	a1,0
    80005718:	00006517          	auipc	a0,0x6
    8000571c:	18850513          	addi	a0,a0,392 # 8000b8a0 <lockPrint>
    80005720:	ffffc097          	auipc	ra,0xffffc
    80005724:	c4c080e7          	jalr	-948(ra) # 8000136c <copy_and_swap>
    80005728:	00050863          	beqz	a0,80005738 <_Z8printIntiii+0x50>
    8000572c:	ffffc097          	auipc	ra,0xffffc
    80005730:	de0080e7          	jalr	-544(ra) # 8000150c <_Z15thread_dispatchv>
    80005734:	fddff06f          	j	80005710 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80005738:	00098463          	beqz	s3,80005740 <_Z8printIntiii+0x58>
    8000573c:	0804c463          	bltz	s1,800057c4 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80005740:	0004851b          	sext.w	a0,s1
    neg = 0;
    80005744:	00000593          	li	a1,0
    }

    i = 0;
    80005748:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    8000574c:	0009079b          	sext.w	a5,s2
    80005750:	0325773b          	remuw	a4,a0,s2
    80005754:	00048613          	mv	a2,s1
    80005758:	0014849b          	addiw	s1,s1,1
    8000575c:	02071693          	slli	a3,a4,0x20
    80005760:	0206d693          	srli	a3,a3,0x20
    80005764:	00006717          	auipc	a4,0x6
    80005768:	fdc70713          	addi	a4,a4,-36 # 8000b740 <digits>
    8000576c:	00d70733          	add	a4,a4,a3
    80005770:	00074683          	lbu	a3,0(a4)
    80005774:	fd040713          	addi	a4,s0,-48
    80005778:	00c70733          	add	a4,a4,a2
    8000577c:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005780:	0005071b          	sext.w	a4,a0
    80005784:	0325553b          	divuw	a0,a0,s2
    80005788:	fcf772e3          	bgeu	a4,a5,8000574c <_Z8printIntiii+0x64>
    if(neg)
    8000578c:	00058c63          	beqz	a1,800057a4 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80005790:	fd040793          	addi	a5,s0,-48
    80005794:	009784b3          	add	s1,a5,s1
    80005798:	02d00793          	li	a5,45
    8000579c:	fef48823          	sb	a5,-16(s1)
    800057a0:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    800057a4:	fff4849b          	addiw	s1,s1,-1
    800057a8:	0204c463          	bltz	s1,800057d0 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    800057ac:	fd040793          	addi	a5,s0,-48
    800057b0:	009787b3          	add	a5,a5,s1
    800057b4:	ff07c503          	lbu	a0,-16(a5)
    800057b8:	ffffc097          	auipc	ra,0xffffc
    800057bc:	f68080e7          	jalr	-152(ra) # 80001720 <_Z4putcc>
    800057c0:	fe5ff06f          	j	800057a4 <_Z8printIntiii+0xbc>
        x = -xx;
    800057c4:	4090053b          	negw	a0,s1
        neg = 1;
    800057c8:	00100593          	li	a1,1
        x = -xx;
    800057cc:	f7dff06f          	j	80005748 <_Z8printIntiii+0x60>

    UNLOCK();
    800057d0:	00000613          	li	a2,0
    800057d4:	00100593          	li	a1,1
    800057d8:	00006517          	auipc	a0,0x6
    800057dc:	0c850513          	addi	a0,a0,200 # 8000b8a0 <lockPrint>
    800057e0:	ffffc097          	auipc	ra,0xffffc
    800057e4:	b8c080e7          	jalr	-1140(ra) # 8000136c <copy_and_swap>
    800057e8:	fe0514e3          	bnez	a0,800057d0 <_Z8printIntiii+0xe8>
    800057ec:	03813083          	ld	ra,56(sp)
    800057f0:	03013403          	ld	s0,48(sp)
    800057f4:	02813483          	ld	s1,40(sp)
    800057f8:	02013903          	ld	s2,32(sp)
    800057fc:	01813983          	ld	s3,24(sp)
    80005800:	04010113          	addi	sp,sp,64
    80005804:	00008067          	ret

0000000080005808 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005808:	fd010113          	addi	sp,sp,-48
    8000580c:	02113423          	sd	ra,40(sp)
    80005810:	02813023          	sd	s0,32(sp)
    80005814:	00913c23          	sd	s1,24(sp)
    80005818:	01213823          	sd	s2,16(sp)
    8000581c:	01313423          	sd	s3,8(sp)
    80005820:	03010413          	addi	s0,sp,48
    80005824:	00050493          	mv	s1,a0
    80005828:	00058913          	mv	s2,a1
    8000582c:	0015879b          	addiw	a5,a1,1
    80005830:	0007851b          	sext.w	a0,a5
    80005834:	00f4a023          	sw	a5,0(s1)
    80005838:	0004a823          	sw	zero,16(s1)
    8000583c:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005840:	00251513          	slli	a0,a0,0x2
    80005844:	ffffc097          	auipc	ra,0xffffc
    80005848:	b64080e7          	jalr	-1180(ra) # 800013a8 <_Z9mem_allocm>
    8000584c:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80005850:	01000513          	li	a0,16
    80005854:	ffffd097          	auipc	ra,0xffffd
    80005858:	a38080e7          	jalr	-1480(ra) # 8000228c <_Znwm>
    8000585c:	00050993          	mv	s3,a0
    80005860:	00000593          	li	a1,0
    80005864:	ffffd097          	auipc	ra,0xffffd
    80005868:	c74080e7          	jalr	-908(ra) # 800024d8 <_ZN9SemaphoreC1Ej>
    8000586c:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80005870:	01000513          	li	a0,16
    80005874:	ffffd097          	auipc	ra,0xffffd
    80005878:	a18080e7          	jalr	-1512(ra) # 8000228c <_Znwm>
    8000587c:	00050993          	mv	s3,a0
    80005880:	00090593          	mv	a1,s2
    80005884:	ffffd097          	auipc	ra,0xffffd
    80005888:	c54080e7          	jalr	-940(ra) # 800024d8 <_ZN9SemaphoreC1Ej>
    8000588c:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80005890:	01000513          	li	a0,16
    80005894:	ffffd097          	auipc	ra,0xffffd
    80005898:	9f8080e7          	jalr	-1544(ra) # 8000228c <_Znwm>
    8000589c:	00050913          	mv	s2,a0
    800058a0:	00100593          	li	a1,1
    800058a4:	ffffd097          	auipc	ra,0xffffd
    800058a8:	c34080e7          	jalr	-972(ra) # 800024d8 <_ZN9SemaphoreC1Ej>
    800058ac:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    800058b0:	01000513          	li	a0,16
    800058b4:	ffffd097          	auipc	ra,0xffffd
    800058b8:	9d8080e7          	jalr	-1576(ra) # 8000228c <_Znwm>
    800058bc:	00050913          	mv	s2,a0
    800058c0:	00100593          	li	a1,1
    800058c4:	ffffd097          	auipc	ra,0xffffd
    800058c8:	c14080e7          	jalr	-1004(ra) # 800024d8 <_ZN9SemaphoreC1Ej>
    800058cc:	0324b823          	sd	s2,48(s1)
}
    800058d0:	02813083          	ld	ra,40(sp)
    800058d4:	02013403          	ld	s0,32(sp)
    800058d8:	01813483          	ld	s1,24(sp)
    800058dc:	01013903          	ld	s2,16(sp)
    800058e0:	00813983          	ld	s3,8(sp)
    800058e4:	03010113          	addi	sp,sp,48
    800058e8:	00008067          	ret
    800058ec:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    800058f0:	00098513          	mv	a0,s3
    800058f4:	ffffd097          	auipc	ra,0xffffd
    800058f8:	9c0080e7          	jalr	-1600(ra) # 800022b4 <_ZdlPv>
    800058fc:	00048513          	mv	a0,s1
    80005900:	00007097          	auipc	ra,0x7
    80005904:	078080e7          	jalr	120(ra) # 8000c978 <_Unwind_Resume>
    80005908:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    8000590c:	00098513          	mv	a0,s3
    80005910:	ffffd097          	auipc	ra,0xffffd
    80005914:	9a4080e7          	jalr	-1628(ra) # 800022b4 <_ZdlPv>
    80005918:	00048513          	mv	a0,s1
    8000591c:	00007097          	auipc	ra,0x7
    80005920:	05c080e7          	jalr	92(ra) # 8000c978 <_Unwind_Resume>
    80005924:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80005928:	00090513          	mv	a0,s2
    8000592c:	ffffd097          	auipc	ra,0xffffd
    80005930:	988080e7          	jalr	-1656(ra) # 800022b4 <_ZdlPv>
    80005934:	00048513          	mv	a0,s1
    80005938:	00007097          	auipc	ra,0x7
    8000593c:	040080e7          	jalr	64(ra) # 8000c978 <_Unwind_Resume>
    80005940:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80005944:	00090513          	mv	a0,s2
    80005948:	ffffd097          	auipc	ra,0xffffd
    8000594c:	96c080e7          	jalr	-1684(ra) # 800022b4 <_ZdlPv>
    80005950:	00048513          	mv	a0,s1
    80005954:	00007097          	auipc	ra,0x7
    80005958:	024080e7          	jalr	36(ra) # 8000c978 <_Unwind_Resume>

000000008000595c <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    8000595c:	fe010113          	addi	sp,sp,-32
    80005960:	00113c23          	sd	ra,24(sp)
    80005964:	00813823          	sd	s0,16(sp)
    80005968:	00913423          	sd	s1,8(sp)
    8000596c:	01213023          	sd	s2,0(sp)
    80005970:	02010413          	addi	s0,sp,32
    80005974:	00050493          	mv	s1,a0
    80005978:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    8000597c:	01853503          	ld	a0,24(a0)
    80005980:	ffffd097          	auipc	ra,0xffffd
    80005984:	b90080e7          	jalr	-1136(ra) # 80002510 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80005988:	0304b503          	ld	a0,48(s1)
    8000598c:	ffffd097          	auipc	ra,0xffffd
    80005990:	b84080e7          	jalr	-1148(ra) # 80002510 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80005994:	0084b783          	ld	a5,8(s1)
    80005998:	0144a703          	lw	a4,20(s1)
    8000599c:	00271713          	slli	a4,a4,0x2
    800059a0:	00e787b3          	add	a5,a5,a4
    800059a4:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800059a8:	0144a783          	lw	a5,20(s1)
    800059ac:	0017879b          	addiw	a5,a5,1
    800059b0:	0004a703          	lw	a4,0(s1)
    800059b4:	02e7e7bb          	remw	a5,a5,a4
    800059b8:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    800059bc:	0304b503          	ld	a0,48(s1)
    800059c0:	ffffd097          	auipc	ra,0xffffd
    800059c4:	b7c080e7          	jalr	-1156(ra) # 8000253c <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    800059c8:	0204b503          	ld	a0,32(s1)
    800059cc:	ffffd097          	auipc	ra,0xffffd
    800059d0:	b70080e7          	jalr	-1168(ra) # 8000253c <_ZN9Semaphore6signalEv>

}
    800059d4:	01813083          	ld	ra,24(sp)
    800059d8:	01013403          	ld	s0,16(sp)
    800059dc:	00813483          	ld	s1,8(sp)
    800059e0:	00013903          	ld	s2,0(sp)
    800059e4:	02010113          	addi	sp,sp,32
    800059e8:	00008067          	ret

00000000800059ec <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    800059ec:	fe010113          	addi	sp,sp,-32
    800059f0:	00113c23          	sd	ra,24(sp)
    800059f4:	00813823          	sd	s0,16(sp)
    800059f8:	00913423          	sd	s1,8(sp)
    800059fc:	01213023          	sd	s2,0(sp)
    80005a00:	02010413          	addi	s0,sp,32
    80005a04:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80005a08:	02053503          	ld	a0,32(a0)
    80005a0c:	ffffd097          	auipc	ra,0xffffd
    80005a10:	b04080e7          	jalr	-1276(ra) # 80002510 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80005a14:	0284b503          	ld	a0,40(s1)
    80005a18:	ffffd097          	auipc	ra,0xffffd
    80005a1c:	af8080e7          	jalr	-1288(ra) # 80002510 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80005a20:	0084b703          	ld	a4,8(s1)
    80005a24:	0104a783          	lw	a5,16(s1)
    80005a28:	00279693          	slli	a3,a5,0x2
    80005a2c:	00d70733          	add	a4,a4,a3
    80005a30:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005a34:	0017879b          	addiw	a5,a5,1
    80005a38:	0004a703          	lw	a4,0(s1)
    80005a3c:	02e7e7bb          	remw	a5,a5,a4
    80005a40:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80005a44:	0284b503          	ld	a0,40(s1)
    80005a48:	ffffd097          	auipc	ra,0xffffd
    80005a4c:	af4080e7          	jalr	-1292(ra) # 8000253c <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80005a50:	0184b503          	ld	a0,24(s1)
    80005a54:	ffffd097          	auipc	ra,0xffffd
    80005a58:	ae8080e7          	jalr	-1304(ra) # 8000253c <_ZN9Semaphore6signalEv>

    return ret;
}
    80005a5c:	00090513          	mv	a0,s2
    80005a60:	01813083          	ld	ra,24(sp)
    80005a64:	01013403          	ld	s0,16(sp)
    80005a68:	00813483          	ld	s1,8(sp)
    80005a6c:	00013903          	ld	s2,0(sp)
    80005a70:	02010113          	addi	sp,sp,32
    80005a74:	00008067          	ret

0000000080005a78 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80005a78:	fe010113          	addi	sp,sp,-32
    80005a7c:	00113c23          	sd	ra,24(sp)
    80005a80:	00813823          	sd	s0,16(sp)
    80005a84:	00913423          	sd	s1,8(sp)
    80005a88:	01213023          	sd	s2,0(sp)
    80005a8c:	02010413          	addi	s0,sp,32
    80005a90:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80005a94:	02853503          	ld	a0,40(a0)
    80005a98:	ffffd097          	auipc	ra,0xffffd
    80005a9c:	a78080e7          	jalr	-1416(ra) # 80002510 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80005aa0:	0304b503          	ld	a0,48(s1)
    80005aa4:	ffffd097          	auipc	ra,0xffffd
    80005aa8:	a6c080e7          	jalr	-1428(ra) # 80002510 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80005aac:	0144a783          	lw	a5,20(s1)
    80005ab0:	0104a903          	lw	s2,16(s1)
    80005ab4:	0327ce63          	blt	a5,s2,80005af0 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80005ab8:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80005abc:	0304b503          	ld	a0,48(s1)
    80005ac0:	ffffd097          	auipc	ra,0xffffd
    80005ac4:	a7c080e7          	jalr	-1412(ra) # 8000253c <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80005ac8:	0284b503          	ld	a0,40(s1)
    80005acc:	ffffd097          	auipc	ra,0xffffd
    80005ad0:	a70080e7          	jalr	-1424(ra) # 8000253c <_ZN9Semaphore6signalEv>

    return ret;
}
    80005ad4:	00090513          	mv	a0,s2
    80005ad8:	01813083          	ld	ra,24(sp)
    80005adc:	01013403          	ld	s0,16(sp)
    80005ae0:	00813483          	ld	s1,8(sp)
    80005ae4:	00013903          	ld	s2,0(sp)
    80005ae8:	02010113          	addi	sp,sp,32
    80005aec:	00008067          	ret
        ret = cap - head + tail;
    80005af0:	0004a703          	lw	a4,0(s1)
    80005af4:	4127093b          	subw	s2,a4,s2
    80005af8:	00f9093b          	addw	s2,s2,a5
    80005afc:	fc1ff06f          	j	80005abc <_ZN9BufferCPP6getCntEv+0x44>

0000000080005b00 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80005b00:	fe010113          	addi	sp,sp,-32
    80005b04:	00113c23          	sd	ra,24(sp)
    80005b08:	00813823          	sd	s0,16(sp)
    80005b0c:	00913423          	sd	s1,8(sp)
    80005b10:	02010413          	addi	s0,sp,32
    80005b14:	00050493          	mv	s1,a0
    Console::putc('\n');
    80005b18:	00a00513          	li	a0,10
    80005b1c:	ffffd097          	auipc	ra,0xffffd
    80005b20:	ae8080e7          	jalr	-1304(ra) # 80002604 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80005b24:	00003517          	auipc	a0,0x3
    80005b28:	6dc50513          	addi	a0,a0,1756 # 80009200 <CONSOLE_STATUS+0x1f0>
    80005b2c:	00000097          	auipc	ra,0x0
    80005b30:	a0c080e7          	jalr	-1524(ra) # 80005538 <_Z11printStringPKc>
    while (getCnt()) {
    80005b34:	00048513          	mv	a0,s1
    80005b38:	00000097          	auipc	ra,0x0
    80005b3c:	f40080e7          	jalr	-192(ra) # 80005a78 <_ZN9BufferCPP6getCntEv>
    80005b40:	02050c63          	beqz	a0,80005b78 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80005b44:	0084b783          	ld	a5,8(s1)
    80005b48:	0104a703          	lw	a4,16(s1)
    80005b4c:	00271713          	slli	a4,a4,0x2
    80005b50:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80005b54:	0007c503          	lbu	a0,0(a5)
    80005b58:	ffffd097          	auipc	ra,0xffffd
    80005b5c:	aac080e7          	jalr	-1364(ra) # 80002604 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80005b60:	0104a783          	lw	a5,16(s1)
    80005b64:	0017879b          	addiw	a5,a5,1
    80005b68:	0004a703          	lw	a4,0(s1)
    80005b6c:	02e7e7bb          	remw	a5,a5,a4
    80005b70:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80005b74:	fc1ff06f          	j	80005b34 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80005b78:	02100513          	li	a0,33
    80005b7c:	ffffd097          	auipc	ra,0xffffd
    80005b80:	a88080e7          	jalr	-1400(ra) # 80002604 <_ZN7Console4putcEc>
    Console::putc('\n');
    80005b84:	00a00513          	li	a0,10
    80005b88:	ffffd097          	auipc	ra,0xffffd
    80005b8c:	a7c080e7          	jalr	-1412(ra) # 80002604 <_ZN7Console4putcEc>
    mem_free(buffer);
    80005b90:	0084b503          	ld	a0,8(s1)
    80005b94:	ffffc097          	auipc	ra,0xffffc
    80005b98:	854080e7          	jalr	-1964(ra) # 800013e8 <_Z8mem_freePv>
    delete itemAvailable;
    80005b9c:	0204b503          	ld	a0,32(s1)
    80005ba0:	00050863          	beqz	a0,80005bb0 <_ZN9BufferCPPD1Ev+0xb0>
    80005ba4:	00053783          	ld	a5,0(a0)
    80005ba8:	0087b783          	ld	a5,8(a5)
    80005bac:	000780e7          	jalr	a5
    delete spaceAvailable;
    80005bb0:	0184b503          	ld	a0,24(s1)
    80005bb4:	00050863          	beqz	a0,80005bc4 <_ZN9BufferCPPD1Ev+0xc4>
    80005bb8:	00053783          	ld	a5,0(a0)
    80005bbc:	0087b783          	ld	a5,8(a5)
    80005bc0:	000780e7          	jalr	a5
    delete mutexTail;
    80005bc4:	0304b503          	ld	a0,48(s1)
    80005bc8:	00050863          	beqz	a0,80005bd8 <_ZN9BufferCPPD1Ev+0xd8>
    80005bcc:	00053783          	ld	a5,0(a0)
    80005bd0:	0087b783          	ld	a5,8(a5)
    80005bd4:	000780e7          	jalr	a5
    delete mutexHead;
    80005bd8:	0284b503          	ld	a0,40(s1)
    80005bdc:	00050863          	beqz	a0,80005bec <_ZN9BufferCPPD1Ev+0xec>
    80005be0:	00053783          	ld	a5,0(a0)
    80005be4:	0087b783          	ld	a5,8(a5)
    80005be8:	000780e7          	jalr	a5
}
    80005bec:	01813083          	ld	ra,24(sp)
    80005bf0:	01013403          	ld	s0,16(sp)
    80005bf4:	00813483          	ld	s1,8(sp)
    80005bf8:	02010113          	addi	sp,sp,32
    80005bfc:	00008067          	ret

0000000080005c00 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80005c00:	fe010113          	addi	sp,sp,-32
    80005c04:	00113c23          	sd	ra,24(sp)
    80005c08:	00813823          	sd	s0,16(sp)
    80005c0c:	00913423          	sd	s1,8(sp)
    80005c10:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80005c14:	00003517          	auipc	a0,0x3
    80005c18:	60450513          	addi	a0,a0,1540 # 80009218 <CONSOLE_STATUS+0x208>
    80005c1c:	00000097          	auipc	ra,0x0
    80005c20:	91c080e7          	jalr	-1764(ra) # 80005538 <_Z11printStringPKc>
    int test = getc() - '0';
    80005c24:	ffffc097          	auipc	ra,0xffffc
    80005c28:	ac0080e7          	jalr	-1344(ra) # 800016e4 <_Z4getcv>
    80005c2c:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80005c30:	ffffc097          	auipc	ra,0xffffc
    80005c34:	ab4080e7          	jalr	-1356(ra) # 800016e4 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80005c38:	00700793          	li	a5,7
    80005c3c:	1097e263          	bltu	a5,s1,80005d40 <_Z8userMainv+0x140>
    80005c40:	00249493          	slli	s1,s1,0x2
    80005c44:	00004717          	auipc	a4,0x4
    80005c48:	82c70713          	addi	a4,a4,-2004 # 80009470 <CONSOLE_STATUS+0x460>
    80005c4c:	00e484b3          	add	s1,s1,a4
    80005c50:	0004a783          	lw	a5,0(s1)
    80005c54:	00e787b3          	add	a5,a5,a4
    80005c58:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80005c5c:	fffff097          	auipc	ra,0xfffff
    80005c60:	f54080e7          	jalr	-172(ra) # 80004bb0 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80005c64:	00003517          	auipc	a0,0x3
    80005c68:	5d450513          	addi	a0,a0,1492 # 80009238 <CONSOLE_STATUS+0x228>
    80005c6c:	00000097          	auipc	ra,0x0
    80005c70:	8cc080e7          	jalr	-1844(ra) # 80005538 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80005c74:	01813083          	ld	ra,24(sp)
    80005c78:	01013403          	ld	s0,16(sp)
    80005c7c:	00813483          	ld	s1,8(sp)
    80005c80:	02010113          	addi	sp,sp,32
    80005c84:	00008067          	ret
            Threads_CPP_API_test();
    80005c88:	ffffe097          	auipc	ra,0xffffe
    80005c8c:	e08080e7          	jalr	-504(ra) # 80003a90 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80005c90:	00003517          	auipc	a0,0x3
    80005c94:	5e850513          	addi	a0,a0,1512 # 80009278 <CONSOLE_STATUS+0x268>
    80005c98:	00000097          	auipc	ra,0x0
    80005c9c:	8a0080e7          	jalr	-1888(ra) # 80005538 <_Z11printStringPKc>
            break;
    80005ca0:	fd5ff06f          	j	80005c74 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80005ca4:	ffffd097          	auipc	ra,0xffffd
    80005ca8:	640080e7          	jalr	1600(ra) # 800032e4 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80005cac:	00003517          	auipc	a0,0x3
    80005cb0:	60c50513          	addi	a0,a0,1548 # 800092b8 <CONSOLE_STATUS+0x2a8>
    80005cb4:	00000097          	auipc	ra,0x0
    80005cb8:	884080e7          	jalr	-1916(ra) # 80005538 <_Z11printStringPKc>
            break;
    80005cbc:	fb9ff06f          	j	80005c74 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80005cc0:	fffff097          	auipc	ra,0xfffff
    80005cc4:	234080e7          	jalr	564(ra) # 80004ef4 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80005cc8:	00003517          	auipc	a0,0x3
    80005ccc:	64050513          	addi	a0,a0,1600 # 80009308 <CONSOLE_STATUS+0x2f8>
    80005cd0:	00000097          	auipc	ra,0x0
    80005cd4:	868080e7          	jalr	-1944(ra) # 80005538 <_Z11printStringPKc>
            break;
    80005cd8:	f9dff06f          	j	80005c74 <_Z8userMainv+0x74>
            testSleeping();
    80005cdc:	00000097          	auipc	ra,0x0
    80005ce0:	11c080e7          	jalr	284(ra) # 80005df8 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80005ce4:	00003517          	auipc	a0,0x3
    80005ce8:	67c50513          	addi	a0,a0,1660 # 80009360 <CONSOLE_STATUS+0x350>
    80005cec:	00000097          	auipc	ra,0x0
    80005cf0:	84c080e7          	jalr	-1972(ra) # 80005538 <_Z11printStringPKc>
            break;
    80005cf4:	f81ff06f          	j	80005c74 <_Z8userMainv+0x74>
            testConsumerProducer();
    80005cf8:	ffffe097          	auipc	ra,0xffffe
    80005cfc:	258080e7          	jalr	600(ra) # 80003f50 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80005d00:	00003517          	auipc	a0,0x3
    80005d04:	69050513          	addi	a0,a0,1680 # 80009390 <CONSOLE_STATUS+0x380>
    80005d08:	00000097          	auipc	ra,0x0
    80005d0c:	830080e7          	jalr	-2000(ra) # 80005538 <_Z11printStringPKc>
            break;
    80005d10:	f65ff06f          	j	80005c74 <_Z8userMainv+0x74>
            System_Mode_test();
    80005d14:	00000097          	auipc	ra,0x0
    80005d18:	658080e7          	jalr	1624(ra) # 8000636c <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80005d1c:	00003517          	auipc	a0,0x3
    80005d20:	6b450513          	addi	a0,a0,1716 # 800093d0 <CONSOLE_STATUS+0x3c0>
    80005d24:	00000097          	auipc	ra,0x0
    80005d28:	814080e7          	jalr	-2028(ra) # 80005538 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80005d2c:	00003517          	auipc	a0,0x3
    80005d30:	6c450513          	addi	a0,a0,1732 # 800093f0 <CONSOLE_STATUS+0x3e0>
    80005d34:	00000097          	auipc	ra,0x0
    80005d38:	804080e7          	jalr	-2044(ra) # 80005538 <_Z11printStringPKc>
            break;
    80005d3c:	f39ff06f          	j	80005c74 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    80005d40:	00003517          	auipc	a0,0x3
    80005d44:	70850513          	addi	a0,a0,1800 # 80009448 <CONSOLE_STATUS+0x438>
    80005d48:	fffff097          	auipc	ra,0xfffff
    80005d4c:	7f0080e7          	jalr	2032(ra) # 80005538 <_Z11printStringPKc>
    80005d50:	f25ff06f          	j	80005c74 <_Z8userMainv+0x74>

0000000080005d54 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80005d54:	fe010113          	addi	sp,sp,-32
    80005d58:	00113c23          	sd	ra,24(sp)
    80005d5c:	00813823          	sd	s0,16(sp)
    80005d60:	00913423          	sd	s1,8(sp)
    80005d64:	01213023          	sd	s2,0(sp)
    80005d68:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80005d6c:	00053903          	ld	s2,0(a0)
    int i = 6;
    80005d70:	00600493          	li	s1,6
    while (--i > 0) {
    80005d74:	fff4849b          	addiw	s1,s1,-1
    80005d78:	04905463          	blez	s1,80005dc0 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    80005d7c:	00003517          	auipc	a0,0x3
    80005d80:	71450513          	addi	a0,a0,1812 # 80009490 <CONSOLE_STATUS+0x480>
    80005d84:	fffff097          	auipc	ra,0xfffff
    80005d88:	7b4080e7          	jalr	1972(ra) # 80005538 <_Z11printStringPKc>
        printInt(sleep_time);
    80005d8c:	00000613          	li	a2,0
    80005d90:	00a00593          	li	a1,10
    80005d94:	0009051b          	sext.w	a0,s2
    80005d98:	00000097          	auipc	ra,0x0
    80005d9c:	950080e7          	jalr	-1712(ra) # 800056e8 <_Z8printIntiii>
        printString(" !\n");
    80005da0:	00003517          	auipc	a0,0x3
    80005da4:	6f850513          	addi	a0,a0,1784 # 80009498 <CONSOLE_STATUS+0x488>
    80005da8:	fffff097          	auipc	ra,0xfffff
    80005dac:	790080e7          	jalr	1936(ra) # 80005538 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80005db0:	00090513          	mv	a0,s2
    80005db4:	ffffb097          	auipc	ra,0xffffb
    80005db8:	7bc080e7          	jalr	1980(ra) # 80001570 <_Z10time_sleepm>
    while (--i > 0) {
    80005dbc:	fb9ff06f          	j	80005d74 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80005dc0:	00a00793          	li	a5,10
    80005dc4:	02f95933          	divu	s2,s2,a5
    80005dc8:	fff90913          	addi	s2,s2,-1
    80005dcc:	00006797          	auipc	a5,0x6
    80005dd0:	adc78793          	addi	a5,a5,-1316 # 8000b8a8 <_ZL8finished>
    80005dd4:	01278933          	add	s2,a5,s2
    80005dd8:	00100793          	li	a5,1
    80005ddc:	00f90023          	sb	a5,0(s2)
}
    80005de0:	01813083          	ld	ra,24(sp)
    80005de4:	01013403          	ld	s0,16(sp)
    80005de8:	00813483          	ld	s1,8(sp)
    80005dec:	00013903          	ld	s2,0(sp)
    80005df0:	02010113          	addi	sp,sp,32
    80005df4:	00008067          	ret

0000000080005df8 <_Z12testSleepingv>:

void testSleeping() {
    80005df8:	fc010113          	addi	sp,sp,-64
    80005dfc:	02113c23          	sd	ra,56(sp)
    80005e00:	02813823          	sd	s0,48(sp)
    80005e04:	02913423          	sd	s1,40(sp)
    80005e08:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80005e0c:	00a00793          	li	a5,10
    80005e10:	fcf43823          	sd	a5,-48(s0)
    80005e14:	01400793          	li	a5,20
    80005e18:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80005e1c:	00000493          	li	s1,0
    80005e20:	02c0006f          	j	80005e4c <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80005e24:	00349793          	slli	a5,s1,0x3
    80005e28:	fd040613          	addi	a2,s0,-48
    80005e2c:	00f60633          	add	a2,a2,a5
    80005e30:	00000597          	auipc	a1,0x0
    80005e34:	f2458593          	addi	a1,a1,-220 # 80005d54 <_ZL9sleepyRunPv>
    80005e38:	fc040513          	addi	a0,s0,-64
    80005e3c:	00f50533          	add	a0,a0,a5
    80005e40:	ffffb097          	auipc	ra,0xffffb
    80005e44:	5e8080e7          	jalr	1512(ra) # 80001428 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80005e48:	0014849b          	addiw	s1,s1,1
    80005e4c:	00100793          	li	a5,1
    80005e50:	fc97dae3          	bge	a5,s1,80005e24 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80005e54:	00006797          	auipc	a5,0x6
    80005e58:	a547c783          	lbu	a5,-1452(a5) # 8000b8a8 <_ZL8finished>
    80005e5c:	fe078ce3          	beqz	a5,80005e54 <_Z12testSleepingv+0x5c>
    80005e60:	00006797          	auipc	a5,0x6
    80005e64:	a497c783          	lbu	a5,-1463(a5) # 8000b8a9 <_ZL8finished+0x1>
    80005e68:	fe0786e3          	beqz	a5,80005e54 <_Z12testSleepingv+0x5c>
}
    80005e6c:	03813083          	ld	ra,56(sp)
    80005e70:	03013403          	ld	s0,48(sp)
    80005e74:	02813483          	ld	s1,40(sp)
    80005e78:	04010113          	addi	sp,sp,64
    80005e7c:	00008067          	ret

0000000080005e80 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80005e80:	fe010113          	addi	sp,sp,-32
    80005e84:	00113c23          	sd	ra,24(sp)
    80005e88:	00813823          	sd	s0,16(sp)
    80005e8c:	00913423          	sd	s1,8(sp)
    80005e90:	01213023          	sd	s2,0(sp)
    80005e94:	02010413          	addi	s0,sp,32
    80005e98:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80005e9c:	00100793          	li	a5,1
    80005ea0:	02a7f863          	bgeu	a5,a0,80005ed0 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80005ea4:	00a00793          	li	a5,10
    80005ea8:	02f577b3          	remu	a5,a0,a5
    80005eac:	02078e63          	beqz	a5,80005ee8 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80005eb0:	fff48513          	addi	a0,s1,-1
    80005eb4:	00000097          	auipc	ra,0x0
    80005eb8:	fcc080e7          	jalr	-52(ra) # 80005e80 <_ZL9fibonaccim>
    80005ebc:	00050913          	mv	s2,a0
    80005ec0:	ffe48513          	addi	a0,s1,-2
    80005ec4:	00000097          	auipc	ra,0x0
    80005ec8:	fbc080e7          	jalr	-68(ra) # 80005e80 <_ZL9fibonaccim>
    80005ecc:	00a90533          	add	a0,s2,a0
}
    80005ed0:	01813083          	ld	ra,24(sp)
    80005ed4:	01013403          	ld	s0,16(sp)
    80005ed8:	00813483          	ld	s1,8(sp)
    80005edc:	00013903          	ld	s2,0(sp)
    80005ee0:	02010113          	addi	sp,sp,32
    80005ee4:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80005ee8:	ffffb097          	auipc	ra,0xffffb
    80005eec:	624080e7          	jalr	1572(ra) # 8000150c <_Z15thread_dispatchv>
    80005ef0:	fc1ff06f          	j	80005eb0 <_ZL9fibonaccim+0x30>

0000000080005ef4 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80005ef4:	fe010113          	addi	sp,sp,-32
    80005ef8:	00113c23          	sd	ra,24(sp)
    80005efc:	00813823          	sd	s0,16(sp)
    80005f00:	00913423          	sd	s1,8(sp)
    80005f04:	01213023          	sd	s2,0(sp)
    80005f08:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80005f0c:	00a00493          	li	s1,10
    80005f10:	0400006f          	j	80005f50 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005f14:	00003517          	auipc	a0,0x3
    80005f18:	25450513          	addi	a0,a0,596 # 80009168 <CONSOLE_STATUS+0x158>
    80005f1c:	fffff097          	auipc	ra,0xfffff
    80005f20:	61c080e7          	jalr	1564(ra) # 80005538 <_Z11printStringPKc>
    80005f24:	00000613          	li	a2,0
    80005f28:	00a00593          	li	a1,10
    80005f2c:	00048513          	mv	a0,s1
    80005f30:	fffff097          	auipc	ra,0xfffff
    80005f34:	7b8080e7          	jalr	1976(ra) # 800056e8 <_Z8printIntiii>
    80005f38:	00003517          	auipc	a0,0x3
    80005f3c:	42050513          	addi	a0,a0,1056 # 80009358 <CONSOLE_STATUS+0x348>
    80005f40:	fffff097          	auipc	ra,0xfffff
    80005f44:	5f8080e7          	jalr	1528(ra) # 80005538 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80005f48:	0014849b          	addiw	s1,s1,1
    80005f4c:	0ff4f493          	andi	s1,s1,255
    80005f50:	00c00793          	li	a5,12
    80005f54:	fc97f0e3          	bgeu	a5,s1,80005f14 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80005f58:	00003517          	auipc	a0,0x3
    80005f5c:	21850513          	addi	a0,a0,536 # 80009170 <CONSOLE_STATUS+0x160>
    80005f60:	fffff097          	auipc	ra,0xfffff
    80005f64:	5d8080e7          	jalr	1496(ra) # 80005538 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80005f68:	00500313          	li	t1,5
    thread_dispatch();
    80005f6c:	ffffb097          	auipc	ra,0xffffb
    80005f70:	5a0080e7          	jalr	1440(ra) # 8000150c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80005f74:	01000513          	li	a0,16
    80005f78:	00000097          	auipc	ra,0x0
    80005f7c:	f08080e7          	jalr	-248(ra) # 80005e80 <_ZL9fibonaccim>
    80005f80:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80005f84:	00003517          	auipc	a0,0x3
    80005f88:	1fc50513          	addi	a0,a0,508 # 80009180 <CONSOLE_STATUS+0x170>
    80005f8c:	fffff097          	auipc	ra,0xfffff
    80005f90:	5ac080e7          	jalr	1452(ra) # 80005538 <_Z11printStringPKc>
    80005f94:	00000613          	li	a2,0
    80005f98:	00a00593          	li	a1,10
    80005f9c:	0009051b          	sext.w	a0,s2
    80005fa0:	fffff097          	auipc	ra,0xfffff
    80005fa4:	748080e7          	jalr	1864(ra) # 800056e8 <_Z8printIntiii>
    80005fa8:	00003517          	auipc	a0,0x3
    80005fac:	3b050513          	addi	a0,a0,944 # 80009358 <CONSOLE_STATUS+0x348>
    80005fb0:	fffff097          	auipc	ra,0xfffff
    80005fb4:	588080e7          	jalr	1416(ra) # 80005538 <_Z11printStringPKc>
    80005fb8:	0400006f          	j	80005ff8 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005fbc:	00003517          	auipc	a0,0x3
    80005fc0:	1ac50513          	addi	a0,a0,428 # 80009168 <CONSOLE_STATUS+0x158>
    80005fc4:	fffff097          	auipc	ra,0xfffff
    80005fc8:	574080e7          	jalr	1396(ra) # 80005538 <_Z11printStringPKc>
    80005fcc:	00000613          	li	a2,0
    80005fd0:	00a00593          	li	a1,10
    80005fd4:	00048513          	mv	a0,s1
    80005fd8:	fffff097          	auipc	ra,0xfffff
    80005fdc:	710080e7          	jalr	1808(ra) # 800056e8 <_Z8printIntiii>
    80005fe0:	00003517          	auipc	a0,0x3
    80005fe4:	37850513          	addi	a0,a0,888 # 80009358 <CONSOLE_STATUS+0x348>
    80005fe8:	fffff097          	auipc	ra,0xfffff
    80005fec:	550080e7          	jalr	1360(ra) # 80005538 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80005ff0:	0014849b          	addiw	s1,s1,1
    80005ff4:	0ff4f493          	andi	s1,s1,255
    80005ff8:	00f00793          	li	a5,15
    80005ffc:	fc97f0e3          	bgeu	a5,s1,80005fbc <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006000:	00003517          	auipc	a0,0x3
    80006004:	19050513          	addi	a0,a0,400 # 80009190 <CONSOLE_STATUS+0x180>
    80006008:	fffff097          	auipc	ra,0xfffff
    8000600c:	530080e7          	jalr	1328(ra) # 80005538 <_Z11printStringPKc>
    finishedD = true;
    80006010:	00100793          	li	a5,1
    80006014:	00006717          	auipc	a4,0x6
    80006018:	88f70b23          	sb	a5,-1898(a4) # 8000b8aa <_ZL9finishedD>
    thread_dispatch();
    8000601c:	ffffb097          	auipc	ra,0xffffb
    80006020:	4f0080e7          	jalr	1264(ra) # 8000150c <_Z15thread_dispatchv>
}
    80006024:	01813083          	ld	ra,24(sp)
    80006028:	01013403          	ld	s0,16(sp)
    8000602c:	00813483          	ld	s1,8(sp)
    80006030:	00013903          	ld	s2,0(sp)
    80006034:	02010113          	addi	sp,sp,32
    80006038:	00008067          	ret

000000008000603c <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    8000603c:	fe010113          	addi	sp,sp,-32
    80006040:	00113c23          	sd	ra,24(sp)
    80006044:	00813823          	sd	s0,16(sp)
    80006048:	00913423          	sd	s1,8(sp)
    8000604c:	01213023          	sd	s2,0(sp)
    80006050:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006054:	00000493          	li	s1,0
    80006058:	0400006f          	j	80006098 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    8000605c:	00003517          	auipc	a0,0x3
    80006060:	0dc50513          	addi	a0,a0,220 # 80009138 <CONSOLE_STATUS+0x128>
    80006064:	fffff097          	auipc	ra,0xfffff
    80006068:	4d4080e7          	jalr	1236(ra) # 80005538 <_Z11printStringPKc>
    8000606c:	00000613          	li	a2,0
    80006070:	00a00593          	li	a1,10
    80006074:	00048513          	mv	a0,s1
    80006078:	fffff097          	auipc	ra,0xfffff
    8000607c:	670080e7          	jalr	1648(ra) # 800056e8 <_Z8printIntiii>
    80006080:	00003517          	auipc	a0,0x3
    80006084:	2d850513          	addi	a0,a0,728 # 80009358 <CONSOLE_STATUS+0x348>
    80006088:	fffff097          	auipc	ra,0xfffff
    8000608c:	4b0080e7          	jalr	1200(ra) # 80005538 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006090:	0014849b          	addiw	s1,s1,1
    80006094:	0ff4f493          	andi	s1,s1,255
    80006098:	00200793          	li	a5,2
    8000609c:	fc97f0e3          	bgeu	a5,s1,8000605c <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800060a0:	00003517          	auipc	a0,0x3
    800060a4:	0a050513          	addi	a0,a0,160 # 80009140 <CONSOLE_STATUS+0x130>
    800060a8:	fffff097          	auipc	ra,0xfffff
    800060ac:	490080e7          	jalr	1168(ra) # 80005538 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800060b0:	00700313          	li	t1,7
    thread_dispatch();
    800060b4:	ffffb097          	auipc	ra,0xffffb
    800060b8:	458080e7          	jalr	1112(ra) # 8000150c <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800060bc:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800060c0:	00003517          	auipc	a0,0x3
    800060c4:	09050513          	addi	a0,a0,144 # 80009150 <CONSOLE_STATUS+0x140>
    800060c8:	fffff097          	auipc	ra,0xfffff
    800060cc:	470080e7          	jalr	1136(ra) # 80005538 <_Z11printStringPKc>
    800060d0:	00000613          	li	a2,0
    800060d4:	00a00593          	li	a1,10
    800060d8:	0009051b          	sext.w	a0,s2
    800060dc:	fffff097          	auipc	ra,0xfffff
    800060e0:	60c080e7          	jalr	1548(ra) # 800056e8 <_Z8printIntiii>
    800060e4:	00003517          	auipc	a0,0x3
    800060e8:	27450513          	addi	a0,a0,628 # 80009358 <CONSOLE_STATUS+0x348>
    800060ec:	fffff097          	auipc	ra,0xfffff
    800060f0:	44c080e7          	jalr	1100(ra) # 80005538 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    800060f4:	00c00513          	li	a0,12
    800060f8:	00000097          	auipc	ra,0x0
    800060fc:	d88080e7          	jalr	-632(ra) # 80005e80 <_ZL9fibonaccim>
    80006100:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006104:	00003517          	auipc	a0,0x3
    80006108:	05450513          	addi	a0,a0,84 # 80009158 <CONSOLE_STATUS+0x148>
    8000610c:	fffff097          	auipc	ra,0xfffff
    80006110:	42c080e7          	jalr	1068(ra) # 80005538 <_Z11printStringPKc>
    80006114:	00000613          	li	a2,0
    80006118:	00a00593          	li	a1,10
    8000611c:	0009051b          	sext.w	a0,s2
    80006120:	fffff097          	auipc	ra,0xfffff
    80006124:	5c8080e7          	jalr	1480(ra) # 800056e8 <_Z8printIntiii>
    80006128:	00003517          	auipc	a0,0x3
    8000612c:	23050513          	addi	a0,a0,560 # 80009358 <CONSOLE_STATUS+0x348>
    80006130:	fffff097          	auipc	ra,0xfffff
    80006134:	408080e7          	jalr	1032(ra) # 80005538 <_Z11printStringPKc>
    80006138:	0400006f          	j	80006178 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    8000613c:	00003517          	auipc	a0,0x3
    80006140:	ffc50513          	addi	a0,a0,-4 # 80009138 <CONSOLE_STATUS+0x128>
    80006144:	fffff097          	auipc	ra,0xfffff
    80006148:	3f4080e7          	jalr	1012(ra) # 80005538 <_Z11printStringPKc>
    8000614c:	00000613          	li	a2,0
    80006150:	00a00593          	li	a1,10
    80006154:	00048513          	mv	a0,s1
    80006158:	fffff097          	auipc	ra,0xfffff
    8000615c:	590080e7          	jalr	1424(ra) # 800056e8 <_Z8printIntiii>
    80006160:	00003517          	auipc	a0,0x3
    80006164:	1f850513          	addi	a0,a0,504 # 80009358 <CONSOLE_STATUS+0x348>
    80006168:	fffff097          	auipc	ra,0xfffff
    8000616c:	3d0080e7          	jalr	976(ra) # 80005538 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006170:	0014849b          	addiw	s1,s1,1
    80006174:	0ff4f493          	andi	s1,s1,255
    80006178:	00500793          	li	a5,5
    8000617c:	fc97f0e3          	bgeu	a5,s1,8000613c <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006180:	00003517          	auipc	a0,0x3
    80006184:	f9050513          	addi	a0,a0,-112 # 80009110 <CONSOLE_STATUS+0x100>
    80006188:	fffff097          	auipc	ra,0xfffff
    8000618c:	3b0080e7          	jalr	944(ra) # 80005538 <_Z11printStringPKc>
    finishedC = true;
    80006190:	00100793          	li	a5,1
    80006194:	00005717          	auipc	a4,0x5
    80006198:	70f70ba3          	sb	a5,1815(a4) # 8000b8ab <_ZL9finishedC>
    thread_dispatch();
    8000619c:	ffffb097          	auipc	ra,0xffffb
    800061a0:	370080e7          	jalr	880(ra) # 8000150c <_Z15thread_dispatchv>
}
    800061a4:	01813083          	ld	ra,24(sp)
    800061a8:	01013403          	ld	s0,16(sp)
    800061ac:	00813483          	ld	s1,8(sp)
    800061b0:	00013903          	ld	s2,0(sp)
    800061b4:	02010113          	addi	sp,sp,32
    800061b8:	00008067          	ret

00000000800061bc <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    800061bc:	fe010113          	addi	sp,sp,-32
    800061c0:	00113c23          	sd	ra,24(sp)
    800061c4:	00813823          	sd	s0,16(sp)
    800061c8:	00913423          	sd	s1,8(sp)
    800061cc:	01213023          	sd	s2,0(sp)
    800061d0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800061d4:	00000913          	li	s2,0
    800061d8:	0400006f          	j	80006218 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    800061dc:	ffffb097          	auipc	ra,0xffffb
    800061e0:	330080e7          	jalr	816(ra) # 8000150c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800061e4:	00148493          	addi	s1,s1,1
    800061e8:	000027b7          	lui	a5,0x2
    800061ec:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800061f0:	0097ee63          	bltu	a5,s1,8000620c <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800061f4:	00000713          	li	a4,0
    800061f8:	000077b7          	lui	a5,0x7
    800061fc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006200:	fce7eee3          	bltu	a5,a4,800061dc <_ZL11workerBodyBPv+0x20>
    80006204:	00170713          	addi	a4,a4,1
    80006208:	ff1ff06f          	j	800061f8 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    8000620c:	00a00793          	li	a5,10
    80006210:	04f90663          	beq	s2,a5,8000625c <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80006214:	00190913          	addi	s2,s2,1
    80006218:	00f00793          	li	a5,15
    8000621c:	0527e463          	bltu	a5,s2,80006264 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80006220:	00003517          	auipc	a0,0x3
    80006224:	f0050513          	addi	a0,a0,-256 # 80009120 <CONSOLE_STATUS+0x110>
    80006228:	fffff097          	auipc	ra,0xfffff
    8000622c:	310080e7          	jalr	784(ra) # 80005538 <_Z11printStringPKc>
    80006230:	00000613          	li	a2,0
    80006234:	00a00593          	li	a1,10
    80006238:	0009051b          	sext.w	a0,s2
    8000623c:	fffff097          	auipc	ra,0xfffff
    80006240:	4ac080e7          	jalr	1196(ra) # 800056e8 <_Z8printIntiii>
    80006244:	00003517          	auipc	a0,0x3
    80006248:	11450513          	addi	a0,a0,276 # 80009358 <CONSOLE_STATUS+0x348>
    8000624c:	fffff097          	auipc	ra,0xfffff
    80006250:	2ec080e7          	jalr	748(ra) # 80005538 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006254:	00000493          	li	s1,0
    80006258:	f91ff06f          	j	800061e8 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    8000625c:	14102ff3          	csrr	t6,sepc
    80006260:	fb5ff06f          	j	80006214 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80006264:	00003517          	auipc	a0,0x3
    80006268:	ec450513          	addi	a0,a0,-316 # 80009128 <CONSOLE_STATUS+0x118>
    8000626c:	fffff097          	auipc	ra,0xfffff
    80006270:	2cc080e7          	jalr	716(ra) # 80005538 <_Z11printStringPKc>
    finishedB = true;
    80006274:	00100793          	li	a5,1
    80006278:	00005717          	auipc	a4,0x5
    8000627c:	62f70a23          	sb	a5,1588(a4) # 8000b8ac <_ZL9finishedB>
    thread_dispatch();
    80006280:	ffffb097          	auipc	ra,0xffffb
    80006284:	28c080e7          	jalr	652(ra) # 8000150c <_Z15thread_dispatchv>
}
    80006288:	01813083          	ld	ra,24(sp)
    8000628c:	01013403          	ld	s0,16(sp)
    80006290:	00813483          	ld	s1,8(sp)
    80006294:	00013903          	ld	s2,0(sp)
    80006298:	02010113          	addi	sp,sp,32
    8000629c:	00008067          	ret

00000000800062a0 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800062a0:	fe010113          	addi	sp,sp,-32
    800062a4:	00113c23          	sd	ra,24(sp)
    800062a8:	00813823          	sd	s0,16(sp)
    800062ac:	00913423          	sd	s1,8(sp)
    800062b0:	01213023          	sd	s2,0(sp)
    800062b4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800062b8:	00000913          	li	s2,0
    800062bc:	0380006f          	j	800062f4 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    800062c0:	ffffb097          	auipc	ra,0xffffb
    800062c4:	24c080e7          	jalr	588(ra) # 8000150c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800062c8:	00148493          	addi	s1,s1,1
    800062cc:	000027b7          	lui	a5,0x2
    800062d0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800062d4:	0097ee63          	bltu	a5,s1,800062f0 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800062d8:	00000713          	li	a4,0
    800062dc:	000077b7          	lui	a5,0x7
    800062e0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800062e4:	fce7eee3          	bltu	a5,a4,800062c0 <_ZL11workerBodyAPv+0x20>
    800062e8:	00170713          	addi	a4,a4,1
    800062ec:	ff1ff06f          	j	800062dc <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800062f0:	00190913          	addi	s2,s2,1
    800062f4:	00900793          	li	a5,9
    800062f8:	0527e063          	bltu	a5,s2,80006338 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800062fc:	00003517          	auipc	a0,0x3
    80006300:	e0c50513          	addi	a0,a0,-500 # 80009108 <CONSOLE_STATUS+0xf8>
    80006304:	fffff097          	auipc	ra,0xfffff
    80006308:	234080e7          	jalr	564(ra) # 80005538 <_Z11printStringPKc>
    8000630c:	00000613          	li	a2,0
    80006310:	00a00593          	li	a1,10
    80006314:	0009051b          	sext.w	a0,s2
    80006318:	fffff097          	auipc	ra,0xfffff
    8000631c:	3d0080e7          	jalr	976(ra) # 800056e8 <_Z8printIntiii>
    80006320:	00003517          	auipc	a0,0x3
    80006324:	03850513          	addi	a0,a0,56 # 80009358 <CONSOLE_STATUS+0x348>
    80006328:	fffff097          	auipc	ra,0xfffff
    8000632c:	210080e7          	jalr	528(ra) # 80005538 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006330:	00000493          	li	s1,0
    80006334:	f99ff06f          	j	800062cc <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006338:	00003517          	auipc	a0,0x3
    8000633c:	dd850513          	addi	a0,a0,-552 # 80009110 <CONSOLE_STATUS+0x100>
    80006340:	fffff097          	auipc	ra,0xfffff
    80006344:	1f8080e7          	jalr	504(ra) # 80005538 <_Z11printStringPKc>
    finishedA = true;
    80006348:	00100793          	li	a5,1
    8000634c:	00005717          	auipc	a4,0x5
    80006350:	56f700a3          	sb	a5,1377(a4) # 8000b8ad <_ZL9finishedA>
}
    80006354:	01813083          	ld	ra,24(sp)
    80006358:	01013403          	ld	s0,16(sp)
    8000635c:	00813483          	ld	s1,8(sp)
    80006360:	00013903          	ld	s2,0(sp)
    80006364:	02010113          	addi	sp,sp,32
    80006368:	00008067          	ret

000000008000636c <_Z16System_Mode_testv>:


void System_Mode_test() {
    8000636c:	fd010113          	addi	sp,sp,-48
    80006370:	02113423          	sd	ra,40(sp)
    80006374:	02813023          	sd	s0,32(sp)
    80006378:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    8000637c:	00000613          	li	a2,0
    80006380:	00000597          	auipc	a1,0x0
    80006384:	f2058593          	addi	a1,a1,-224 # 800062a0 <_ZL11workerBodyAPv>
    80006388:	fd040513          	addi	a0,s0,-48
    8000638c:	ffffb097          	auipc	ra,0xffffb
    80006390:	09c080e7          	jalr	156(ra) # 80001428 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80006394:	00003517          	auipc	a0,0x3
    80006398:	e0c50513          	addi	a0,a0,-500 # 800091a0 <CONSOLE_STATUS+0x190>
    8000639c:	fffff097          	auipc	ra,0xfffff
    800063a0:	19c080e7          	jalr	412(ra) # 80005538 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800063a4:	00000613          	li	a2,0
    800063a8:	00000597          	auipc	a1,0x0
    800063ac:	e1458593          	addi	a1,a1,-492 # 800061bc <_ZL11workerBodyBPv>
    800063b0:	fd840513          	addi	a0,s0,-40
    800063b4:	ffffb097          	auipc	ra,0xffffb
    800063b8:	074080e7          	jalr	116(ra) # 80001428 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    800063bc:	00003517          	auipc	a0,0x3
    800063c0:	dfc50513          	addi	a0,a0,-516 # 800091b8 <CONSOLE_STATUS+0x1a8>
    800063c4:	fffff097          	auipc	ra,0xfffff
    800063c8:	174080e7          	jalr	372(ra) # 80005538 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    800063cc:	00000613          	li	a2,0
    800063d0:	00000597          	auipc	a1,0x0
    800063d4:	c6c58593          	addi	a1,a1,-916 # 8000603c <_ZL11workerBodyCPv>
    800063d8:	fe040513          	addi	a0,s0,-32
    800063dc:	ffffb097          	auipc	ra,0xffffb
    800063e0:	04c080e7          	jalr	76(ra) # 80001428 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    800063e4:	00003517          	auipc	a0,0x3
    800063e8:	dec50513          	addi	a0,a0,-532 # 800091d0 <CONSOLE_STATUS+0x1c0>
    800063ec:	fffff097          	auipc	ra,0xfffff
    800063f0:	14c080e7          	jalr	332(ra) # 80005538 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    800063f4:	00000613          	li	a2,0
    800063f8:	00000597          	auipc	a1,0x0
    800063fc:	afc58593          	addi	a1,a1,-1284 # 80005ef4 <_ZL11workerBodyDPv>
    80006400:	fe840513          	addi	a0,s0,-24
    80006404:	ffffb097          	auipc	ra,0xffffb
    80006408:	024080e7          	jalr	36(ra) # 80001428 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    8000640c:	00003517          	auipc	a0,0x3
    80006410:	ddc50513          	addi	a0,a0,-548 # 800091e8 <CONSOLE_STATUS+0x1d8>
    80006414:	fffff097          	auipc	ra,0xfffff
    80006418:	124080e7          	jalr	292(ra) # 80005538 <_Z11printStringPKc>
    8000641c:	00c0006f          	j	80006428 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006420:	ffffb097          	auipc	ra,0xffffb
    80006424:	0ec080e7          	jalr	236(ra) # 8000150c <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006428:	00005797          	auipc	a5,0x5
    8000642c:	4857c783          	lbu	a5,1157(a5) # 8000b8ad <_ZL9finishedA>
    80006430:	fe0788e3          	beqz	a5,80006420 <_Z16System_Mode_testv+0xb4>
    80006434:	00005797          	auipc	a5,0x5
    80006438:	4787c783          	lbu	a5,1144(a5) # 8000b8ac <_ZL9finishedB>
    8000643c:	fe0782e3          	beqz	a5,80006420 <_Z16System_Mode_testv+0xb4>
    80006440:	00005797          	auipc	a5,0x5
    80006444:	46b7c783          	lbu	a5,1131(a5) # 8000b8ab <_ZL9finishedC>
    80006448:	fc078ce3          	beqz	a5,80006420 <_Z16System_Mode_testv+0xb4>
    8000644c:	00005797          	auipc	a5,0x5
    80006450:	45e7c783          	lbu	a5,1118(a5) # 8000b8aa <_ZL9finishedD>
    80006454:	fc0786e3          	beqz	a5,80006420 <_Z16System_Mode_testv+0xb4>
    }

}
    80006458:	02813083          	ld	ra,40(sp)
    8000645c:	02013403          	ld	s0,32(sp)
    80006460:	03010113          	addi	sp,sp,48
    80006464:	00008067          	ret

0000000080006468 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006468:	fe010113          	addi	sp,sp,-32
    8000646c:	00113c23          	sd	ra,24(sp)
    80006470:	00813823          	sd	s0,16(sp)
    80006474:	00913423          	sd	s1,8(sp)
    80006478:	01213023          	sd	s2,0(sp)
    8000647c:	02010413          	addi	s0,sp,32
    80006480:	00050493          	mv	s1,a0
    80006484:	00058913          	mv	s2,a1
    80006488:	0015879b          	addiw	a5,a1,1
    8000648c:	0007851b          	sext.w	a0,a5
    80006490:	00f4a023          	sw	a5,0(s1)
    80006494:	0004a823          	sw	zero,16(s1)
    80006498:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    8000649c:	00251513          	slli	a0,a0,0x2
    800064a0:	ffffb097          	auipc	ra,0xffffb
    800064a4:	f08080e7          	jalr	-248(ra) # 800013a8 <_Z9mem_allocm>
    800064a8:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    800064ac:	00000593          	li	a1,0
    800064b0:	02048513          	addi	a0,s1,32
    800064b4:	ffffb097          	auipc	ra,0xffffb
    800064b8:	0f0080e7          	jalr	240(ra) # 800015a4 <_Z8sem_openPP9semaphorej>
    sem_open(&spaceAvailable, _cap);
    800064bc:	00090593          	mv	a1,s2
    800064c0:	01848513          	addi	a0,s1,24
    800064c4:	ffffb097          	auipc	ra,0xffffb
    800064c8:	0e0080e7          	jalr	224(ra) # 800015a4 <_Z8sem_openPP9semaphorej>
    sem_open(&mutexHead, 1);
    800064cc:	00100593          	li	a1,1
    800064d0:	02848513          	addi	a0,s1,40
    800064d4:	ffffb097          	auipc	ra,0xffffb
    800064d8:	0d0080e7          	jalr	208(ra) # 800015a4 <_Z8sem_openPP9semaphorej>
    sem_open(&mutexTail, 1);
    800064dc:	00100593          	li	a1,1
    800064e0:	03048513          	addi	a0,s1,48
    800064e4:	ffffb097          	auipc	ra,0xffffb
    800064e8:	0c0080e7          	jalr	192(ra) # 800015a4 <_Z8sem_openPP9semaphorej>
}
    800064ec:	01813083          	ld	ra,24(sp)
    800064f0:	01013403          	ld	s0,16(sp)
    800064f4:	00813483          	ld	s1,8(sp)
    800064f8:	00013903          	ld	s2,0(sp)
    800064fc:	02010113          	addi	sp,sp,32
    80006500:	00008067          	ret

0000000080006504 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006504:	fe010113          	addi	sp,sp,-32
    80006508:	00113c23          	sd	ra,24(sp)
    8000650c:	00813823          	sd	s0,16(sp)
    80006510:	00913423          	sd	s1,8(sp)
    80006514:	01213023          	sd	s2,0(sp)
    80006518:	02010413          	addi	s0,sp,32
    8000651c:	00050493          	mv	s1,a0
    80006520:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006524:	01853503          	ld	a0,24(a0)
    80006528:	ffffb097          	auipc	ra,0xffffb
    8000652c:	124080e7          	jalr	292(ra) # 8000164c <_Z8sem_waitP9semaphore>

    sem_wait(mutexTail);
    80006530:	0304b503          	ld	a0,48(s1)
    80006534:	ffffb097          	auipc	ra,0xffffb
    80006538:	118080e7          	jalr	280(ra) # 8000164c <_Z8sem_waitP9semaphore>
    buffer[tail] = val;
    8000653c:	0084b783          	ld	a5,8(s1)
    80006540:	0144a703          	lw	a4,20(s1)
    80006544:	00271713          	slli	a4,a4,0x2
    80006548:	00e787b3          	add	a5,a5,a4
    8000654c:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006550:	0144a783          	lw	a5,20(s1)
    80006554:	0017879b          	addiw	a5,a5,1
    80006558:	0004a703          	lw	a4,0(s1)
    8000655c:	02e7e7bb          	remw	a5,a5,a4
    80006560:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006564:	0304b503          	ld	a0,48(s1)
    80006568:	ffffb097          	auipc	ra,0xffffb
    8000656c:	130080e7          	jalr	304(ra) # 80001698 <_Z10sem_signalP9semaphore>

    sem_signal(itemAvailable);
    80006570:	0204b503          	ld	a0,32(s1)
    80006574:	ffffb097          	auipc	ra,0xffffb
    80006578:	124080e7          	jalr	292(ra) # 80001698 <_Z10sem_signalP9semaphore>

}
    8000657c:	01813083          	ld	ra,24(sp)
    80006580:	01013403          	ld	s0,16(sp)
    80006584:	00813483          	ld	s1,8(sp)
    80006588:	00013903          	ld	s2,0(sp)
    8000658c:	02010113          	addi	sp,sp,32
    80006590:	00008067          	ret

0000000080006594 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006594:	fe010113          	addi	sp,sp,-32
    80006598:	00113c23          	sd	ra,24(sp)
    8000659c:	00813823          	sd	s0,16(sp)
    800065a0:	00913423          	sd	s1,8(sp)
    800065a4:	01213023          	sd	s2,0(sp)
    800065a8:	02010413          	addi	s0,sp,32
    800065ac:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    800065b0:	02053503          	ld	a0,32(a0)
    800065b4:	ffffb097          	auipc	ra,0xffffb
    800065b8:	098080e7          	jalr	152(ra) # 8000164c <_Z8sem_waitP9semaphore>

    sem_wait(mutexHead);
    800065bc:	0284b503          	ld	a0,40(s1)
    800065c0:	ffffb097          	auipc	ra,0xffffb
    800065c4:	08c080e7          	jalr	140(ra) # 8000164c <_Z8sem_waitP9semaphore>

    int ret = buffer[head];
    800065c8:	0084b703          	ld	a4,8(s1)
    800065cc:	0104a783          	lw	a5,16(s1)
    800065d0:	00279693          	slli	a3,a5,0x2
    800065d4:	00d70733          	add	a4,a4,a3
    800065d8:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800065dc:	0017879b          	addiw	a5,a5,1
    800065e0:	0004a703          	lw	a4,0(s1)
    800065e4:	02e7e7bb          	remw	a5,a5,a4
    800065e8:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    800065ec:	0284b503          	ld	a0,40(s1)
    800065f0:	ffffb097          	auipc	ra,0xffffb
    800065f4:	0a8080e7          	jalr	168(ra) # 80001698 <_Z10sem_signalP9semaphore>

    sem_signal(spaceAvailable);
    800065f8:	0184b503          	ld	a0,24(s1)
    800065fc:	ffffb097          	auipc	ra,0xffffb
    80006600:	09c080e7          	jalr	156(ra) # 80001698 <_Z10sem_signalP9semaphore>

    return ret;
}
    80006604:	00090513          	mv	a0,s2
    80006608:	01813083          	ld	ra,24(sp)
    8000660c:	01013403          	ld	s0,16(sp)
    80006610:	00813483          	ld	s1,8(sp)
    80006614:	00013903          	ld	s2,0(sp)
    80006618:	02010113          	addi	sp,sp,32
    8000661c:	00008067          	ret

0000000080006620 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006620:	fe010113          	addi	sp,sp,-32
    80006624:	00113c23          	sd	ra,24(sp)
    80006628:	00813823          	sd	s0,16(sp)
    8000662c:	00913423          	sd	s1,8(sp)
    80006630:	01213023          	sd	s2,0(sp)
    80006634:	02010413          	addi	s0,sp,32
    80006638:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    8000663c:	02853503          	ld	a0,40(a0)
    80006640:	ffffb097          	auipc	ra,0xffffb
    80006644:	00c080e7          	jalr	12(ra) # 8000164c <_Z8sem_waitP9semaphore>
    sem_wait(mutexTail);
    80006648:	0304b503          	ld	a0,48(s1)
    8000664c:	ffffb097          	auipc	ra,0xffffb
    80006650:	000080e7          	jalr	ra # 8000164c <_Z8sem_waitP9semaphore>

    if (tail >= head) {
    80006654:	0144a783          	lw	a5,20(s1)
    80006658:	0104a903          	lw	s2,16(s1)
    8000665c:	0327ce63          	blt	a5,s2,80006698 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006660:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006664:	0304b503          	ld	a0,48(s1)
    80006668:	ffffb097          	auipc	ra,0xffffb
    8000666c:	030080e7          	jalr	48(ra) # 80001698 <_Z10sem_signalP9semaphore>
    sem_signal(mutexHead);
    80006670:	0284b503          	ld	a0,40(s1)
    80006674:	ffffb097          	auipc	ra,0xffffb
    80006678:	024080e7          	jalr	36(ra) # 80001698 <_Z10sem_signalP9semaphore>

    return ret;
}
    8000667c:	00090513          	mv	a0,s2
    80006680:	01813083          	ld	ra,24(sp)
    80006684:	01013403          	ld	s0,16(sp)
    80006688:	00813483          	ld	s1,8(sp)
    8000668c:	00013903          	ld	s2,0(sp)
    80006690:	02010113          	addi	sp,sp,32
    80006694:	00008067          	ret
        ret = cap - head + tail;
    80006698:	0004a703          	lw	a4,0(s1)
    8000669c:	4127093b          	subw	s2,a4,s2
    800066a0:	00f9093b          	addw	s2,s2,a5
    800066a4:	fc1ff06f          	j	80006664 <_ZN6Buffer6getCntEv+0x44>

00000000800066a8 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    800066a8:	fe010113          	addi	sp,sp,-32
    800066ac:	00113c23          	sd	ra,24(sp)
    800066b0:	00813823          	sd	s0,16(sp)
    800066b4:	00913423          	sd	s1,8(sp)
    800066b8:	02010413          	addi	s0,sp,32
    800066bc:	00050493          	mv	s1,a0
    putc('\n');
    800066c0:	00a00513          	li	a0,10
    800066c4:	ffffb097          	auipc	ra,0xffffb
    800066c8:	05c080e7          	jalr	92(ra) # 80001720 <_Z4putcc>
    printString("Buffer deleted!\n");
    800066cc:	00003517          	auipc	a0,0x3
    800066d0:	b3450513          	addi	a0,a0,-1228 # 80009200 <CONSOLE_STATUS+0x1f0>
    800066d4:	fffff097          	auipc	ra,0xfffff
    800066d8:	e64080e7          	jalr	-412(ra) # 80005538 <_Z11printStringPKc>
    while (getCnt() > 0) {
    800066dc:	00048513          	mv	a0,s1
    800066e0:	00000097          	auipc	ra,0x0
    800066e4:	f40080e7          	jalr	-192(ra) # 80006620 <_ZN6Buffer6getCntEv>
    800066e8:	02a05c63          	blez	a0,80006720 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    800066ec:	0084b783          	ld	a5,8(s1)
    800066f0:	0104a703          	lw	a4,16(s1)
    800066f4:	00271713          	slli	a4,a4,0x2
    800066f8:	00e787b3          	add	a5,a5,a4
        putc(ch);
    800066fc:	0007c503          	lbu	a0,0(a5)
    80006700:	ffffb097          	auipc	ra,0xffffb
    80006704:	020080e7          	jalr	32(ra) # 80001720 <_Z4putcc>
        head = (head + 1) % cap;
    80006708:	0104a783          	lw	a5,16(s1)
    8000670c:	0017879b          	addiw	a5,a5,1
    80006710:	0004a703          	lw	a4,0(s1)
    80006714:	02e7e7bb          	remw	a5,a5,a4
    80006718:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    8000671c:	fc1ff06f          	j	800066dc <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006720:	02100513          	li	a0,33
    80006724:	ffffb097          	auipc	ra,0xffffb
    80006728:	ffc080e7          	jalr	-4(ra) # 80001720 <_Z4putcc>
    putc('\n');
    8000672c:	00a00513          	li	a0,10
    80006730:	ffffb097          	auipc	ra,0xffffb
    80006734:	ff0080e7          	jalr	-16(ra) # 80001720 <_Z4putcc>
    mem_free(buffer);
    80006738:	0084b503          	ld	a0,8(s1)
    8000673c:	ffffb097          	auipc	ra,0xffffb
    80006740:	cac080e7          	jalr	-852(ra) # 800013e8 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80006744:	0204b503          	ld	a0,32(s1)
    80006748:	ffffb097          	auipc	ra,0xffffb
    8000674c:	eb8080e7          	jalr	-328(ra) # 80001600 <_Z9sem_closeP9semaphore>
    sem_close(spaceAvailable);
    80006750:	0184b503          	ld	a0,24(s1)
    80006754:	ffffb097          	auipc	ra,0xffffb
    80006758:	eac080e7          	jalr	-340(ra) # 80001600 <_Z9sem_closeP9semaphore>
    sem_close(mutexTail);
    8000675c:	0304b503          	ld	a0,48(s1)
    80006760:	ffffb097          	auipc	ra,0xffffb
    80006764:	ea0080e7          	jalr	-352(ra) # 80001600 <_Z9sem_closeP9semaphore>
    sem_close(mutexHead);
    80006768:	0284b503          	ld	a0,40(s1)
    8000676c:	ffffb097          	auipc	ra,0xffffb
    80006770:	e94080e7          	jalr	-364(ra) # 80001600 <_Z9sem_closeP9semaphore>
}
    80006774:	01813083          	ld	ra,24(sp)
    80006778:	01013403          	ld	s0,16(sp)
    8000677c:	00813483          	ld	s1,8(sp)
    80006780:	02010113          	addi	sp,sp,32
    80006784:	00008067          	ret

0000000080006788 <start>:
    80006788:	ff010113          	addi	sp,sp,-16
    8000678c:	00813423          	sd	s0,8(sp)
    80006790:	01010413          	addi	s0,sp,16
    80006794:	300027f3          	csrr	a5,mstatus
    80006798:	ffffe737          	lui	a4,0xffffe
    8000679c:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff1cef>
    800067a0:	00e7f7b3          	and	a5,a5,a4
    800067a4:	00001737          	lui	a4,0x1
    800067a8:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800067ac:	00e7e7b3          	or	a5,a5,a4
    800067b0:	30079073          	csrw	mstatus,a5
    800067b4:	00000797          	auipc	a5,0x0
    800067b8:	16078793          	addi	a5,a5,352 # 80006914 <system_main>
    800067bc:	34179073          	csrw	mepc,a5
    800067c0:	00000793          	li	a5,0
    800067c4:	18079073          	csrw	satp,a5
    800067c8:	000107b7          	lui	a5,0x10
    800067cc:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800067d0:	30279073          	csrw	medeleg,a5
    800067d4:	30379073          	csrw	mideleg,a5
    800067d8:	104027f3          	csrr	a5,sie
    800067dc:	2227e793          	ori	a5,a5,546
    800067e0:	10479073          	csrw	sie,a5
    800067e4:	fff00793          	li	a5,-1
    800067e8:	00a7d793          	srli	a5,a5,0xa
    800067ec:	3b079073          	csrw	pmpaddr0,a5
    800067f0:	00f00793          	li	a5,15
    800067f4:	3a079073          	csrw	pmpcfg0,a5
    800067f8:	f14027f3          	csrr	a5,mhartid
    800067fc:	0200c737          	lui	a4,0x200c
    80006800:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006804:	0007869b          	sext.w	a3,a5
    80006808:	00269713          	slli	a4,a3,0x2
    8000680c:	000f4637          	lui	a2,0xf4
    80006810:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006814:	00d70733          	add	a4,a4,a3
    80006818:	0037979b          	slliw	a5,a5,0x3
    8000681c:	020046b7          	lui	a3,0x2004
    80006820:	00d787b3          	add	a5,a5,a3
    80006824:	00c585b3          	add	a1,a1,a2
    80006828:	00371693          	slli	a3,a4,0x3
    8000682c:	00005717          	auipc	a4,0x5
    80006830:	08470713          	addi	a4,a4,132 # 8000b8b0 <timer_scratch>
    80006834:	00b7b023          	sd	a1,0(a5)
    80006838:	00d70733          	add	a4,a4,a3
    8000683c:	00f73c23          	sd	a5,24(a4)
    80006840:	02c73023          	sd	a2,32(a4)
    80006844:	34071073          	csrw	mscratch,a4
    80006848:	00000797          	auipc	a5,0x0
    8000684c:	6e878793          	addi	a5,a5,1768 # 80006f30 <timervec>
    80006850:	30579073          	csrw	mtvec,a5
    80006854:	300027f3          	csrr	a5,mstatus
    80006858:	0087e793          	ori	a5,a5,8
    8000685c:	30079073          	csrw	mstatus,a5
    80006860:	304027f3          	csrr	a5,mie
    80006864:	0807e793          	ori	a5,a5,128
    80006868:	30479073          	csrw	mie,a5
    8000686c:	f14027f3          	csrr	a5,mhartid
    80006870:	0007879b          	sext.w	a5,a5
    80006874:	00078213          	mv	tp,a5
    80006878:	30200073          	mret
    8000687c:	00813403          	ld	s0,8(sp)
    80006880:	01010113          	addi	sp,sp,16
    80006884:	00008067          	ret

0000000080006888 <timerinit>:
    80006888:	ff010113          	addi	sp,sp,-16
    8000688c:	00813423          	sd	s0,8(sp)
    80006890:	01010413          	addi	s0,sp,16
    80006894:	f14027f3          	csrr	a5,mhartid
    80006898:	0200c737          	lui	a4,0x200c
    8000689c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800068a0:	0007869b          	sext.w	a3,a5
    800068a4:	00269713          	slli	a4,a3,0x2
    800068a8:	000f4637          	lui	a2,0xf4
    800068ac:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800068b0:	00d70733          	add	a4,a4,a3
    800068b4:	0037979b          	slliw	a5,a5,0x3
    800068b8:	020046b7          	lui	a3,0x2004
    800068bc:	00d787b3          	add	a5,a5,a3
    800068c0:	00c585b3          	add	a1,a1,a2
    800068c4:	00371693          	slli	a3,a4,0x3
    800068c8:	00005717          	auipc	a4,0x5
    800068cc:	fe870713          	addi	a4,a4,-24 # 8000b8b0 <timer_scratch>
    800068d0:	00b7b023          	sd	a1,0(a5)
    800068d4:	00d70733          	add	a4,a4,a3
    800068d8:	00f73c23          	sd	a5,24(a4)
    800068dc:	02c73023          	sd	a2,32(a4)
    800068e0:	34071073          	csrw	mscratch,a4
    800068e4:	00000797          	auipc	a5,0x0
    800068e8:	64c78793          	addi	a5,a5,1612 # 80006f30 <timervec>
    800068ec:	30579073          	csrw	mtvec,a5
    800068f0:	300027f3          	csrr	a5,mstatus
    800068f4:	0087e793          	ori	a5,a5,8
    800068f8:	30079073          	csrw	mstatus,a5
    800068fc:	304027f3          	csrr	a5,mie
    80006900:	0807e793          	ori	a5,a5,128
    80006904:	30479073          	csrw	mie,a5
    80006908:	00813403          	ld	s0,8(sp)
    8000690c:	01010113          	addi	sp,sp,16
    80006910:	00008067          	ret

0000000080006914 <system_main>:
    80006914:	fe010113          	addi	sp,sp,-32
    80006918:	00813823          	sd	s0,16(sp)
    8000691c:	00913423          	sd	s1,8(sp)
    80006920:	00113c23          	sd	ra,24(sp)
    80006924:	02010413          	addi	s0,sp,32
    80006928:	00000097          	auipc	ra,0x0
    8000692c:	0c4080e7          	jalr	196(ra) # 800069ec <cpuid>
    80006930:	00005497          	auipc	s1,0x5
    80006934:	eb048493          	addi	s1,s1,-336 # 8000b7e0 <started>
    80006938:	02050263          	beqz	a0,8000695c <system_main+0x48>
    8000693c:	0004a783          	lw	a5,0(s1)
    80006940:	0007879b          	sext.w	a5,a5
    80006944:	fe078ce3          	beqz	a5,8000693c <system_main+0x28>
    80006948:	0ff0000f          	fence
    8000694c:	00003517          	auipc	a0,0x3
    80006950:	b8450513          	addi	a0,a0,-1148 # 800094d0 <CONSOLE_STATUS+0x4c0>
    80006954:	00001097          	auipc	ra,0x1
    80006958:	a78080e7          	jalr	-1416(ra) # 800073cc <panic>
    8000695c:	00001097          	auipc	ra,0x1
    80006960:	9cc080e7          	jalr	-1588(ra) # 80007328 <consoleinit>
    80006964:	00001097          	auipc	ra,0x1
    80006968:	158080e7          	jalr	344(ra) # 80007abc <printfinit>
    8000696c:	00003517          	auipc	a0,0x3
    80006970:	9ec50513          	addi	a0,a0,-1556 # 80009358 <CONSOLE_STATUS+0x348>
    80006974:	00001097          	auipc	ra,0x1
    80006978:	ab4080e7          	jalr	-1356(ra) # 80007428 <__printf>
    8000697c:	00003517          	auipc	a0,0x3
    80006980:	b2450513          	addi	a0,a0,-1244 # 800094a0 <CONSOLE_STATUS+0x490>
    80006984:	00001097          	auipc	ra,0x1
    80006988:	aa4080e7          	jalr	-1372(ra) # 80007428 <__printf>
    8000698c:	00003517          	auipc	a0,0x3
    80006990:	9cc50513          	addi	a0,a0,-1588 # 80009358 <CONSOLE_STATUS+0x348>
    80006994:	00001097          	auipc	ra,0x1
    80006998:	a94080e7          	jalr	-1388(ra) # 80007428 <__printf>
    8000699c:	00001097          	auipc	ra,0x1
    800069a0:	4ac080e7          	jalr	1196(ra) # 80007e48 <kinit>
    800069a4:	00000097          	auipc	ra,0x0
    800069a8:	148080e7          	jalr	328(ra) # 80006aec <trapinit>
    800069ac:	00000097          	auipc	ra,0x0
    800069b0:	16c080e7          	jalr	364(ra) # 80006b18 <trapinithart>
    800069b4:	00000097          	auipc	ra,0x0
    800069b8:	5bc080e7          	jalr	1468(ra) # 80006f70 <plicinit>
    800069bc:	00000097          	auipc	ra,0x0
    800069c0:	5dc080e7          	jalr	1500(ra) # 80006f98 <plicinithart>
    800069c4:	00000097          	auipc	ra,0x0
    800069c8:	078080e7          	jalr	120(ra) # 80006a3c <userinit>
    800069cc:	0ff0000f          	fence
    800069d0:	00100793          	li	a5,1
    800069d4:	00003517          	auipc	a0,0x3
    800069d8:	ae450513          	addi	a0,a0,-1308 # 800094b8 <CONSOLE_STATUS+0x4a8>
    800069dc:	00f4a023          	sw	a5,0(s1)
    800069e0:	00001097          	auipc	ra,0x1
    800069e4:	a48080e7          	jalr	-1464(ra) # 80007428 <__printf>
    800069e8:	0000006f          	j	800069e8 <system_main+0xd4>

00000000800069ec <cpuid>:
    800069ec:	ff010113          	addi	sp,sp,-16
    800069f0:	00813423          	sd	s0,8(sp)
    800069f4:	01010413          	addi	s0,sp,16
    800069f8:	00020513          	mv	a0,tp
    800069fc:	00813403          	ld	s0,8(sp)
    80006a00:	0005051b          	sext.w	a0,a0
    80006a04:	01010113          	addi	sp,sp,16
    80006a08:	00008067          	ret

0000000080006a0c <mycpu>:
    80006a0c:	ff010113          	addi	sp,sp,-16
    80006a10:	00813423          	sd	s0,8(sp)
    80006a14:	01010413          	addi	s0,sp,16
    80006a18:	00020793          	mv	a5,tp
    80006a1c:	00813403          	ld	s0,8(sp)
    80006a20:	0007879b          	sext.w	a5,a5
    80006a24:	00779793          	slli	a5,a5,0x7
    80006a28:	00006517          	auipc	a0,0x6
    80006a2c:	eb850513          	addi	a0,a0,-328 # 8000c8e0 <cpus>
    80006a30:	00f50533          	add	a0,a0,a5
    80006a34:	01010113          	addi	sp,sp,16
    80006a38:	00008067          	ret

0000000080006a3c <userinit>:
    80006a3c:	ff010113          	addi	sp,sp,-16
    80006a40:	00813423          	sd	s0,8(sp)
    80006a44:	01010413          	addi	s0,sp,16
    80006a48:	00813403          	ld	s0,8(sp)
    80006a4c:	01010113          	addi	sp,sp,16
    80006a50:	ffffb317          	auipc	t1,0xffffb
    80006a54:	09030067          	jr	144(t1) # 80001ae0 <main>

0000000080006a58 <either_copyout>:
    80006a58:	ff010113          	addi	sp,sp,-16
    80006a5c:	00813023          	sd	s0,0(sp)
    80006a60:	00113423          	sd	ra,8(sp)
    80006a64:	01010413          	addi	s0,sp,16
    80006a68:	02051663          	bnez	a0,80006a94 <either_copyout+0x3c>
    80006a6c:	00058513          	mv	a0,a1
    80006a70:	00060593          	mv	a1,a2
    80006a74:	0006861b          	sext.w	a2,a3
    80006a78:	00002097          	auipc	ra,0x2
    80006a7c:	c5c080e7          	jalr	-932(ra) # 800086d4 <__memmove>
    80006a80:	00813083          	ld	ra,8(sp)
    80006a84:	00013403          	ld	s0,0(sp)
    80006a88:	00000513          	li	a0,0
    80006a8c:	01010113          	addi	sp,sp,16
    80006a90:	00008067          	ret
    80006a94:	00003517          	auipc	a0,0x3
    80006a98:	a6450513          	addi	a0,a0,-1436 # 800094f8 <CONSOLE_STATUS+0x4e8>
    80006a9c:	00001097          	auipc	ra,0x1
    80006aa0:	930080e7          	jalr	-1744(ra) # 800073cc <panic>

0000000080006aa4 <either_copyin>:
    80006aa4:	ff010113          	addi	sp,sp,-16
    80006aa8:	00813023          	sd	s0,0(sp)
    80006aac:	00113423          	sd	ra,8(sp)
    80006ab0:	01010413          	addi	s0,sp,16
    80006ab4:	02059463          	bnez	a1,80006adc <either_copyin+0x38>
    80006ab8:	00060593          	mv	a1,a2
    80006abc:	0006861b          	sext.w	a2,a3
    80006ac0:	00002097          	auipc	ra,0x2
    80006ac4:	c14080e7          	jalr	-1004(ra) # 800086d4 <__memmove>
    80006ac8:	00813083          	ld	ra,8(sp)
    80006acc:	00013403          	ld	s0,0(sp)
    80006ad0:	00000513          	li	a0,0
    80006ad4:	01010113          	addi	sp,sp,16
    80006ad8:	00008067          	ret
    80006adc:	00003517          	auipc	a0,0x3
    80006ae0:	a4450513          	addi	a0,a0,-1468 # 80009520 <CONSOLE_STATUS+0x510>
    80006ae4:	00001097          	auipc	ra,0x1
    80006ae8:	8e8080e7          	jalr	-1816(ra) # 800073cc <panic>

0000000080006aec <trapinit>:
    80006aec:	ff010113          	addi	sp,sp,-16
    80006af0:	00813423          	sd	s0,8(sp)
    80006af4:	01010413          	addi	s0,sp,16
    80006af8:	00813403          	ld	s0,8(sp)
    80006afc:	00003597          	auipc	a1,0x3
    80006b00:	a4c58593          	addi	a1,a1,-1460 # 80009548 <CONSOLE_STATUS+0x538>
    80006b04:	00006517          	auipc	a0,0x6
    80006b08:	e5c50513          	addi	a0,a0,-420 # 8000c960 <tickslock>
    80006b0c:	01010113          	addi	sp,sp,16
    80006b10:	00001317          	auipc	t1,0x1
    80006b14:	5c830067          	jr	1480(t1) # 800080d8 <initlock>

0000000080006b18 <trapinithart>:
    80006b18:	ff010113          	addi	sp,sp,-16
    80006b1c:	00813423          	sd	s0,8(sp)
    80006b20:	01010413          	addi	s0,sp,16
    80006b24:	00000797          	auipc	a5,0x0
    80006b28:	2fc78793          	addi	a5,a5,764 # 80006e20 <kernelvec>
    80006b2c:	10579073          	csrw	stvec,a5
    80006b30:	00813403          	ld	s0,8(sp)
    80006b34:	01010113          	addi	sp,sp,16
    80006b38:	00008067          	ret

0000000080006b3c <usertrap>:
    80006b3c:	ff010113          	addi	sp,sp,-16
    80006b40:	00813423          	sd	s0,8(sp)
    80006b44:	01010413          	addi	s0,sp,16
    80006b48:	00813403          	ld	s0,8(sp)
    80006b4c:	01010113          	addi	sp,sp,16
    80006b50:	00008067          	ret

0000000080006b54 <usertrapret>:
    80006b54:	ff010113          	addi	sp,sp,-16
    80006b58:	00813423          	sd	s0,8(sp)
    80006b5c:	01010413          	addi	s0,sp,16
    80006b60:	00813403          	ld	s0,8(sp)
    80006b64:	01010113          	addi	sp,sp,16
    80006b68:	00008067          	ret

0000000080006b6c <kerneltrap>:
    80006b6c:	fe010113          	addi	sp,sp,-32
    80006b70:	00813823          	sd	s0,16(sp)
    80006b74:	00113c23          	sd	ra,24(sp)
    80006b78:	00913423          	sd	s1,8(sp)
    80006b7c:	02010413          	addi	s0,sp,32
    80006b80:	142025f3          	csrr	a1,scause
    80006b84:	100027f3          	csrr	a5,sstatus
    80006b88:	0027f793          	andi	a5,a5,2
    80006b8c:	10079c63          	bnez	a5,80006ca4 <kerneltrap+0x138>
    80006b90:	142027f3          	csrr	a5,scause
    80006b94:	0207ce63          	bltz	a5,80006bd0 <kerneltrap+0x64>
    80006b98:	00003517          	auipc	a0,0x3
    80006b9c:	9f850513          	addi	a0,a0,-1544 # 80009590 <CONSOLE_STATUS+0x580>
    80006ba0:	00001097          	auipc	ra,0x1
    80006ba4:	888080e7          	jalr	-1912(ra) # 80007428 <__printf>
    80006ba8:	141025f3          	csrr	a1,sepc
    80006bac:	14302673          	csrr	a2,stval
    80006bb0:	00003517          	auipc	a0,0x3
    80006bb4:	9f050513          	addi	a0,a0,-1552 # 800095a0 <CONSOLE_STATUS+0x590>
    80006bb8:	00001097          	auipc	ra,0x1
    80006bbc:	870080e7          	jalr	-1936(ra) # 80007428 <__printf>
    80006bc0:	00003517          	auipc	a0,0x3
    80006bc4:	9f850513          	addi	a0,a0,-1544 # 800095b8 <CONSOLE_STATUS+0x5a8>
    80006bc8:	00001097          	auipc	ra,0x1
    80006bcc:	804080e7          	jalr	-2044(ra) # 800073cc <panic>
    80006bd0:	0ff7f713          	andi	a4,a5,255
    80006bd4:	00900693          	li	a3,9
    80006bd8:	04d70063          	beq	a4,a3,80006c18 <kerneltrap+0xac>
    80006bdc:	fff00713          	li	a4,-1
    80006be0:	03f71713          	slli	a4,a4,0x3f
    80006be4:	00170713          	addi	a4,a4,1
    80006be8:	fae798e3          	bne	a5,a4,80006b98 <kerneltrap+0x2c>
    80006bec:	00000097          	auipc	ra,0x0
    80006bf0:	e00080e7          	jalr	-512(ra) # 800069ec <cpuid>
    80006bf4:	06050663          	beqz	a0,80006c60 <kerneltrap+0xf4>
    80006bf8:	144027f3          	csrr	a5,sip
    80006bfc:	ffd7f793          	andi	a5,a5,-3
    80006c00:	14479073          	csrw	sip,a5
    80006c04:	01813083          	ld	ra,24(sp)
    80006c08:	01013403          	ld	s0,16(sp)
    80006c0c:	00813483          	ld	s1,8(sp)
    80006c10:	02010113          	addi	sp,sp,32
    80006c14:	00008067          	ret
    80006c18:	00000097          	auipc	ra,0x0
    80006c1c:	3cc080e7          	jalr	972(ra) # 80006fe4 <plic_claim>
    80006c20:	00a00793          	li	a5,10
    80006c24:	00050493          	mv	s1,a0
    80006c28:	06f50863          	beq	a0,a5,80006c98 <kerneltrap+0x12c>
    80006c2c:	fc050ce3          	beqz	a0,80006c04 <kerneltrap+0x98>
    80006c30:	00050593          	mv	a1,a0
    80006c34:	00003517          	auipc	a0,0x3
    80006c38:	93c50513          	addi	a0,a0,-1732 # 80009570 <CONSOLE_STATUS+0x560>
    80006c3c:	00000097          	auipc	ra,0x0
    80006c40:	7ec080e7          	jalr	2028(ra) # 80007428 <__printf>
    80006c44:	01013403          	ld	s0,16(sp)
    80006c48:	01813083          	ld	ra,24(sp)
    80006c4c:	00048513          	mv	a0,s1
    80006c50:	00813483          	ld	s1,8(sp)
    80006c54:	02010113          	addi	sp,sp,32
    80006c58:	00000317          	auipc	t1,0x0
    80006c5c:	3c430067          	jr	964(t1) # 8000701c <plic_complete>
    80006c60:	00006517          	auipc	a0,0x6
    80006c64:	d0050513          	addi	a0,a0,-768 # 8000c960 <tickslock>
    80006c68:	00001097          	auipc	ra,0x1
    80006c6c:	494080e7          	jalr	1172(ra) # 800080fc <acquire>
    80006c70:	00005717          	auipc	a4,0x5
    80006c74:	b7470713          	addi	a4,a4,-1164 # 8000b7e4 <ticks>
    80006c78:	00072783          	lw	a5,0(a4)
    80006c7c:	00006517          	auipc	a0,0x6
    80006c80:	ce450513          	addi	a0,a0,-796 # 8000c960 <tickslock>
    80006c84:	0017879b          	addiw	a5,a5,1
    80006c88:	00f72023          	sw	a5,0(a4)
    80006c8c:	00001097          	auipc	ra,0x1
    80006c90:	53c080e7          	jalr	1340(ra) # 800081c8 <release>
    80006c94:	f65ff06f          	j	80006bf8 <kerneltrap+0x8c>
    80006c98:	00001097          	auipc	ra,0x1
    80006c9c:	098080e7          	jalr	152(ra) # 80007d30 <uartintr>
    80006ca0:	fa5ff06f          	j	80006c44 <kerneltrap+0xd8>
    80006ca4:	00003517          	auipc	a0,0x3
    80006ca8:	8ac50513          	addi	a0,a0,-1876 # 80009550 <CONSOLE_STATUS+0x540>
    80006cac:	00000097          	auipc	ra,0x0
    80006cb0:	720080e7          	jalr	1824(ra) # 800073cc <panic>

0000000080006cb4 <clockintr>:
    80006cb4:	fe010113          	addi	sp,sp,-32
    80006cb8:	00813823          	sd	s0,16(sp)
    80006cbc:	00913423          	sd	s1,8(sp)
    80006cc0:	00113c23          	sd	ra,24(sp)
    80006cc4:	02010413          	addi	s0,sp,32
    80006cc8:	00006497          	auipc	s1,0x6
    80006ccc:	c9848493          	addi	s1,s1,-872 # 8000c960 <tickslock>
    80006cd0:	00048513          	mv	a0,s1
    80006cd4:	00001097          	auipc	ra,0x1
    80006cd8:	428080e7          	jalr	1064(ra) # 800080fc <acquire>
    80006cdc:	00005717          	auipc	a4,0x5
    80006ce0:	b0870713          	addi	a4,a4,-1272 # 8000b7e4 <ticks>
    80006ce4:	00072783          	lw	a5,0(a4)
    80006ce8:	01013403          	ld	s0,16(sp)
    80006cec:	01813083          	ld	ra,24(sp)
    80006cf0:	00048513          	mv	a0,s1
    80006cf4:	0017879b          	addiw	a5,a5,1
    80006cf8:	00813483          	ld	s1,8(sp)
    80006cfc:	00f72023          	sw	a5,0(a4)
    80006d00:	02010113          	addi	sp,sp,32
    80006d04:	00001317          	auipc	t1,0x1
    80006d08:	4c430067          	jr	1220(t1) # 800081c8 <release>

0000000080006d0c <devintr>:
    80006d0c:	142027f3          	csrr	a5,scause
    80006d10:	00000513          	li	a0,0
    80006d14:	0007c463          	bltz	a5,80006d1c <devintr+0x10>
    80006d18:	00008067          	ret
    80006d1c:	fe010113          	addi	sp,sp,-32
    80006d20:	00813823          	sd	s0,16(sp)
    80006d24:	00113c23          	sd	ra,24(sp)
    80006d28:	00913423          	sd	s1,8(sp)
    80006d2c:	02010413          	addi	s0,sp,32
    80006d30:	0ff7f713          	andi	a4,a5,255
    80006d34:	00900693          	li	a3,9
    80006d38:	04d70c63          	beq	a4,a3,80006d90 <devintr+0x84>
    80006d3c:	fff00713          	li	a4,-1
    80006d40:	03f71713          	slli	a4,a4,0x3f
    80006d44:	00170713          	addi	a4,a4,1
    80006d48:	00e78c63          	beq	a5,a4,80006d60 <devintr+0x54>
    80006d4c:	01813083          	ld	ra,24(sp)
    80006d50:	01013403          	ld	s0,16(sp)
    80006d54:	00813483          	ld	s1,8(sp)
    80006d58:	02010113          	addi	sp,sp,32
    80006d5c:	00008067          	ret
    80006d60:	00000097          	auipc	ra,0x0
    80006d64:	c8c080e7          	jalr	-884(ra) # 800069ec <cpuid>
    80006d68:	06050663          	beqz	a0,80006dd4 <devintr+0xc8>
    80006d6c:	144027f3          	csrr	a5,sip
    80006d70:	ffd7f793          	andi	a5,a5,-3
    80006d74:	14479073          	csrw	sip,a5
    80006d78:	01813083          	ld	ra,24(sp)
    80006d7c:	01013403          	ld	s0,16(sp)
    80006d80:	00813483          	ld	s1,8(sp)
    80006d84:	00200513          	li	a0,2
    80006d88:	02010113          	addi	sp,sp,32
    80006d8c:	00008067          	ret
    80006d90:	00000097          	auipc	ra,0x0
    80006d94:	254080e7          	jalr	596(ra) # 80006fe4 <plic_claim>
    80006d98:	00a00793          	li	a5,10
    80006d9c:	00050493          	mv	s1,a0
    80006da0:	06f50663          	beq	a0,a5,80006e0c <devintr+0x100>
    80006da4:	00100513          	li	a0,1
    80006da8:	fa0482e3          	beqz	s1,80006d4c <devintr+0x40>
    80006dac:	00048593          	mv	a1,s1
    80006db0:	00002517          	auipc	a0,0x2
    80006db4:	7c050513          	addi	a0,a0,1984 # 80009570 <CONSOLE_STATUS+0x560>
    80006db8:	00000097          	auipc	ra,0x0
    80006dbc:	670080e7          	jalr	1648(ra) # 80007428 <__printf>
    80006dc0:	00048513          	mv	a0,s1
    80006dc4:	00000097          	auipc	ra,0x0
    80006dc8:	258080e7          	jalr	600(ra) # 8000701c <plic_complete>
    80006dcc:	00100513          	li	a0,1
    80006dd0:	f7dff06f          	j	80006d4c <devintr+0x40>
    80006dd4:	00006517          	auipc	a0,0x6
    80006dd8:	b8c50513          	addi	a0,a0,-1140 # 8000c960 <tickslock>
    80006ddc:	00001097          	auipc	ra,0x1
    80006de0:	320080e7          	jalr	800(ra) # 800080fc <acquire>
    80006de4:	00005717          	auipc	a4,0x5
    80006de8:	a0070713          	addi	a4,a4,-1536 # 8000b7e4 <ticks>
    80006dec:	00072783          	lw	a5,0(a4)
    80006df0:	00006517          	auipc	a0,0x6
    80006df4:	b7050513          	addi	a0,a0,-1168 # 8000c960 <tickslock>
    80006df8:	0017879b          	addiw	a5,a5,1
    80006dfc:	00f72023          	sw	a5,0(a4)
    80006e00:	00001097          	auipc	ra,0x1
    80006e04:	3c8080e7          	jalr	968(ra) # 800081c8 <release>
    80006e08:	f65ff06f          	j	80006d6c <devintr+0x60>
    80006e0c:	00001097          	auipc	ra,0x1
    80006e10:	f24080e7          	jalr	-220(ra) # 80007d30 <uartintr>
    80006e14:	fadff06f          	j	80006dc0 <devintr+0xb4>
	...

0000000080006e20 <kernelvec>:
    80006e20:	f0010113          	addi	sp,sp,-256
    80006e24:	00113023          	sd	ra,0(sp)
    80006e28:	00213423          	sd	sp,8(sp)
    80006e2c:	00313823          	sd	gp,16(sp)
    80006e30:	00413c23          	sd	tp,24(sp)
    80006e34:	02513023          	sd	t0,32(sp)
    80006e38:	02613423          	sd	t1,40(sp)
    80006e3c:	02713823          	sd	t2,48(sp)
    80006e40:	02813c23          	sd	s0,56(sp)
    80006e44:	04913023          	sd	s1,64(sp)
    80006e48:	04a13423          	sd	a0,72(sp)
    80006e4c:	04b13823          	sd	a1,80(sp)
    80006e50:	04c13c23          	sd	a2,88(sp)
    80006e54:	06d13023          	sd	a3,96(sp)
    80006e58:	06e13423          	sd	a4,104(sp)
    80006e5c:	06f13823          	sd	a5,112(sp)
    80006e60:	07013c23          	sd	a6,120(sp)
    80006e64:	09113023          	sd	a7,128(sp)
    80006e68:	09213423          	sd	s2,136(sp)
    80006e6c:	09313823          	sd	s3,144(sp)
    80006e70:	09413c23          	sd	s4,152(sp)
    80006e74:	0b513023          	sd	s5,160(sp)
    80006e78:	0b613423          	sd	s6,168(sp)
    80006e7c:	0b713823          	sd	s7,176(sp)
    80006e80:	0b813c23          	sd	s8,184(sp)
    80006e84:	0d913023          	sd	s9,192(sp)
    80006e88:	0da13423          	sd	s10,200(sp)
    80006e8c:	0db13823          	sd	s11,208(sp)
    80006e90:	0dc13c23          	sd	t3,216(sp)
    80006e94:	0fd13023          	sd	t4,224(sp)
    80006e98:	0fe13423          	sd	t5,232(sp)
    80006e9c:	0ff13823          	sd	t6,240(sp)
    80006ea0:	ccdff0ef          	jal	ra,80006b6c <kerneltrap>
    80006ea4:	00013083          	ld	ra,0(sp)
    80006ea8:	00813103          	ld	sp,8(sp)
    80006eac:	01013183          	ld	gp,16(sp)
    80006eb0:	02013283          	ld	t0,32(sp)
    80006eb4:	02813303          	ld	t1,40(sp)
    80006eb8:	03013383          	ld	t2,48(sp)
    80006ebc:	03813403          	ld	s0,56(sp)
    80006ec0:	04013483          	ld	s1,64(sp)
    80006ec4:	04813503          	ld	a0,72(sp)
    80006ec8:	05013583          	ld	a1,80(sp)
    80006ecc:	05813603          	ld	a2,88(sp)
    80006ed0:	06013683          	ld	a3,96(sp)
    80006ed4:	06813703          	ld	a4,104(sp)
    80006ed8:	07013783          	ld	a5,112(sp)
    80006edc:	07813803          	ld	a6,120(sp)
    80006ee0:	08013883          	ld	a7,128(sp)
    80006ee4:	08813903          	ld	s2,136(sp)
    80006ee8:	09013983          	ld	s3,144(sp)
    80006eec:	09813a03          	ld	s4,152(sp)
    80006ef0:	0a013a83          	ld	s5,160(sp)
    80006ef4:	0a813b03          	ld	s6,168(sp)
    80006ef8:	0b013b83          	ld	s7,176(sp)
    80006efc:	0b813c03          	ld	s8,184(sp)
    80006f00:	0c013c83          	ld	s9,192(sp)
    80006f04:	0c813d03          	ld	s10,200(sp)
    80006f08:	0d013d83          	ld	s11,208(sp)
    80006f0c:	0d813e03          	ld	t3,216(sp)
    80006f10:	0e013e83          	ld	t4,224(sp)
    80006f14:	0e813f03          	ld	t5,232(sp)
    80006f18:	0f013f83          	ld	t6,240(sp)
    80006f1c:	10010113          	addi	sp,sp,256
    80006f20:	10200073          	sret
    80006f24:	00000013          	nop
    80006f28:	00000013          	nop
    80006f2c:	00000013          	nop

0000000080006f30 <timervec>:
    80006f30:	34051573          	csrrw	a0,mscratch,a0
    80006f34:	00b53023          	sd	a1,0(a0)
    80006f38:	00c53423          	sd	a2,8(a0)
    80006f3c:	00d53823          	sd	a3,16(a0)
    80006f40:	01853583          	ld	a1,24(a0)
    80006f44:	02053603          	ld	a2,32(a0)
    80006f48:	0005b683          	ld	a3,0(a1)
    80006f4c:	00c686b3          	add	a3,a3,a2
    80006f50:	00d5b023          	sd	a3,0(a1)
    80006f54:	00200593          	li	a1,2
    80006f58:	14459073          	csrw	sip,a1
    80006f5c:	01053683          	ld	a3,16(a0)
    80006f60:	00853603          	ld	a2,8(a0)
    80006f64:	00053583          	ld	a1,0(a0)
    80006f68:	34051573          	csrrw	a0,mscratch,a0
    80006f6c:	30200073          	mret

0000000080006f70 <plicinit>:
    80006f70:	ff010113          	addi	sp,sp,-16
    80006f74:	00813423          	sd	s0,8(sp)
    80006f78:	01010413          	addi	s0,sp,16
    80006f7c:	00813403          	ld	s0,8(sp)
    80006f80:	0c0007b7          	lui	a5,0xc000
    80006f84:	00100713          	li	a4,1
    80006f88:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80006f8c:	00e7a223          	sw	a4,4(a5)
    80006f90:	01010113          	addi	sp,sp,16
    80006f94:	00008067          	ret

0000000080006f98 <plicinithart>:
    80006f98:	ff010113          	addi	sp,sp,-16
    80006f9c:	00813023          	sd	s0,0(sp)
    80006fa0:	00113423          	sd	ra,8(sp)
    80006fa4:	01010413          	addi	s0,sp,16
    80006fa8:	00000097          	auipc	ra,0x0
    80006fac:	a44080e7          	jalr	-1468(ra) # 800069ec <cpuid>
    80006fb0:	0085171b          	slliw	a4,a0,0x8
    80006fb4:	0c0027b7          	lui	a5,0xc002
    80006fb8:	00e787b3          	add	a5,a5,a4
    80006fbc:	40200713          	li	a4,1026
    80006fc0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80006fc4:	00813083          	ld	ra,8(sp)
    80006fc8:	00013403          	ld	s0,0(sp)
    80006fcc:	00d5151b          	slliw	a0,a0,0xd
    80006fd0:	0c2017b7          	lui	a5,0xc201
    80006fd4:	00a78533          	add	a0,a5,a0
    80006fd8:	00052023          	sw	zero,0(a0)
    80006fdc:	01010113          	addi	sp,sp,16
    80006fe0:	00008067          	ret

0000000080006fe4 <plic_claim>:
    80006fe4:	ff010113          	addi	sp,sp,-16
    80006fe8:	00813023          	sd	s0,0(sp)
    80006fec:	00113423          	sd	ra,8(sp)
    80006ff0:	01010413          	addi	s0,sp,16
    80006ff4:	00000097          	auipc	ra,0x0
    80006ff8:	9f8080e7          	jalr	-1544(ra) # 800069ec <cpuid>
    80006ffc:	00813083          	ld	ra,8(sp)
    80007000:	00013403          	ld	s0,0(sp)
    80007004:	00d5151b          	slliw	a0,a0,0xd
    80007008:	0c2017b7          	lui	a5,0xc201
    8000700c:	00a78533          	add	a0,a5,a0
    80007010:	00452503          	lw	a0,4(a0)
    80007014:	01010113          	addi	sp,sp,16
    80007018:	00008067          	ret

000000008000701c <plic_complete>:
    8000701c:	fe010113          	addi	sp,sp,-32
    80007020:	00813823          	sd	s0,16(sp)
    80007024:	00913423          	sd	s1,8(sp)
    80007028:	00113c23          	sd	ra,24(sp)
    8000702c:	02010413          	addi	s0,sp,32
    80007030:	00050493          	mv	s1,a0
    80007034:	00000097          	auipc	ra,0x0
    80007038:	9b8080e7          	jalr	-1608(ra) # 800069ec <cpuid>
    8000703c:	01813083          	ld	ra,24(sp)
    80007040:	01013403          	ld	s0,16(sp)
    80007044:	00d5179b          	slliw	a5,a0,0xd
    80007048:	0c201737          	lui	a4,0xc201
    8000704c:	00f707b3          	add	a5,a4,a5
    80007050:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80007054:	00813483          	ld	s1,8(sp)
    80007058:	02010113          	addi	sp,sp,32
    8000705c:	00008067          	ret

0000000080007060 <consolewrite>:
    80007060:	fb010113          	addi	sp,sp,-80
    80007064:	04813023          	sd	s0,64(sp)
    80007068:	04113423          	sd	ra,72(sp)
    8000706c:	02913c23          	sd	s1,56(sp)
    80007070:	03213823          	sd	s2,48(sp)
    80007074:	03313423          	sd	s3,40(sp)
    80007078:	03413023          	sd	s4,32(sp)
    8000707c:	01513c23          	sd	s5,24(sp)
    80007080:	05010413          	addi	s0,sp,80
    80007084:	06c05c63          	blez	a2,800070fc <consolewrite+0x9c>
    80007088:	00060993          	mv	s3,a2
    8000708c:	00050a13          	mv	s4,a0
    80007090:	00058493          	mv	s1,a1
    80007094:	00000913          	li	s2,0
    80007098:	fff00a93          	li	s5,-1
    8000709c:	01c0006f          	j	800070b8 <consolewrite+0x58>
    800070a0:	fbf44503          	lbu	a0,-65(s0)
    800070a4:	0019091b          	addiw	s2,s2,1
    800070a8:	00148493          	addi	s1,s1,1
    800070ac:	00001097          	auipc	ra,0x1
    800070b0:	a9c080e7          	jalr	-1380(ra) # 80007b48 <uartputc>
    800070b4:	03298063          	beq	s3,s2,800070d4 <consolewrite+0x74>
    800070b8:	00048613          	mv	a2,s1
    800070bc:	00100693          	li	a3,1
    800070c0:	000a0593          	mv	a1,s4
    800070c4:	fbf40513          	addi	a0,s0,-65
    800070c8:	00000097          	auipc	ra,0x0
    800070cc:	9dc080e7          	jalr	-1572(ra) # 80006aa4 <either_copyin>
    800070d0:	fd5518e3          	bne	a0,s5,800070a0 <consolewrite+0x40>
    800070d4:	04813083          	ld	ra,72(sp)
    800070d8:	04013403          	ld	s0,64(sp)
    800070dc:	03813483          	ld	s1,56(sp)
    800070e0:	02813983          	ld	s3,40(sp)
    800070e4:	02013a03          	ld	s4,32(sp)
    800070e8:	01813a83          	ld	s5,24(sp)
    800070ec:	00090513          	mv	a0,s2
    800070f0:	03013903          	ld	s2,48(sp)
    800070f4:	05010113          	addi	sp,sp,80
    800070f8:	00008067          	ret
    800070fc:	00000913          	li	s2,0
    80007100:	fd5ff06f          	j	800070d4 <consolewrite+0x74>

0000000080007104 <consoleread>:
    80007104:	f9010113          	addi	sp,sp,-112
    80007108:	06813023          	sd	s0,96(sp)
    8000710c:	04913c23          	sd	s1,88(sp)
    80007110:	05213823          	sd	s2,80(sp)
    80007114:	05313423          	sd	s3,72(sp)
    80007118:	05413023          	sd	s4,64(sp)
    8000711c:	03513c23          	sd	s5,56(sp)
    80007120:	03613823          	sd	s6,48(sp)
    80007124:	03713423          	sd	s7,40(sp)
    80007128:	03813023          	sd	s8,32(sp)
    8000712c:	06113423          	sd	ra,104(sp)
    80007130:	01913c23          	sd	s9,24(sp)
    80007134:	07010413          	addi	s0,sp,112
    80007138:	00060b93          	mv	s7,a2
    8000713c:	00050913          	mv	s2,a0
    80007140:	00058c13          	mv	s8,a1
    80007144:	00060b1b          	sext.w	s6,a2
    80007148:	00006497          	auipc	s1,0x6
    8000714c:	84048493          	addi	s1,s1,-1984 # 8000c988 <cons>
    80007150:	00400993          	li	s3,4
    80007154:	fff00a13          	li	s4,-1
    80007158:	00a00a93          	li	s5,10
    8000715c:	05705e63          	blez	s7,800071b8 <consoleread+0xb4>
    80007160:	09c4a703          	lw	a4,156(s1)
    80007164:	0984a783          	lw	a5,152(s1)
    80007168:	0007071b          	sext.w	a4,a4
    8000716c:	08e78463          	beq	a5,a4,800071f4 <consoleread+0xf0>
    80007170:	07f7f713          	andi	a4,a5,127
    80007174:	00e48733          	add	a4,s1,a4
    80007178:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000717c:	0017869b          	addiw	a3,a5,1
    80007180:	08d4ac23          	sw	a3,152(s1)
    80007184:	00070c9b          	sext.w	s9,a4
    80007188:	0b370663          	beq	a4,s3,80007234 <consoleread+0x130>
    8000718c:	00100693          	li	a3,1
    80007190:	f9f40613          	addi	a2,s0,-97
    80007194:	000c0593          	mv	a1,s8
    80007198:	00090513          	mv	a0,s2
    8000719c:	f8e40fa3          	sb	a4,-97(s0)
    800071a0:	00000097          	auipc	ra,0x0
    800071a4:	8b8080e7          	jalr	-1864(ra) # 80006a58 <either_copyout>
    800071a8:	01450863          	beq	a0,s4,800071b8 <consoleread+0xb4>
    800071ac:	001c0c13          	addi	s8,s8,1
    800071b0:	fffb8b9b          	addiw	s7,s7,-1
    800071b4:	fb5c94e3          	bne	s9,s5,8000715c <consoleread+0x58>
    800071b8:	000b851b          	sext.w	a0,s7
    800071bc:	06813083          	ld	ra,104(sp)
    800071c0:	06013403          	ld	s0,96(sp)
    800071c4:	05813483          	ld	s1,88(sp)
    800071c8:	05013903          	ld	s2,80(sp)
    800071cc:	04813983          	ld	s3,72(sp)
    800071d0:	04013a03          	ld	s4,64(sp)
    800071d4:	03813a83          	ld	s5,56(sp)
    800071d8:	02813b83          	ld	s7,40(sp)
    800071dc:	02013c03          	ld	s8,32(sp)
    800071e0:	01813c83          	ld	s9,24(sp)
    800071e4:	40ab053b          	subw	a0,s6,a0
    800071e8:	03013b03          	ld	s6,48(sp)
    800071ec:	07010113          	addi	sp,sp,112
    800071f0:	00008067          	ret
    800071f4:	00001097          	auipc	ra,0x1
    800071f8:	1d8080e7          	jalr	472(ra) # 800083cc <push_on>
    800071fc:	0984a703          	lw	a4,152(s1)
    80007200:	09c4a783          	lw	a5,156(s1)
    80007204:	0007879b          	sext.w	a5,a5
    80007208:	fef70ce3          	beq	a4,a5,80007200 <consoleread+0xfc>
    8000720c:	00001097          	auipc	ra,0x1
    80007210:	234080e7          	jalr	564(ra) # 80008440 <pop_on>
    80007214:	0984a783          	lw	a5,152(s1)
    80007218:	07f7f713          	andi	a4,a5,127
    8000721c:	00e48733          	add	a4,s1,a4
    80007220:	01874703          	lbu	a4,24(a4)
    80007224:	0017869b          	addiw	a3,a5,1
    80007228:	08d4ac23          	sw	a3,152(s1)
    8000722c:	00070c9b          	sext.w	s9,a4
    80007230:	f5371ee3          	bne	a4,s3,8000718c <consoleread+0x88>
    80007234:	000b851b          	sext.w	a0,s7
    80007238:	f96bf2e3          	bgeu	s7,s6,800071bc <consoleread+0xb8>
    8000723c:	08f4ac23          	sw	a5,152(s1)
    80007240:	f7dff06f          	j	800071bc <consoleread+0xb8>

0000000080007244 <consputc>:
    80007244:	10000793          	li	a5,256
    80007248:	00f50663          	beq	a0,a5,80007254 <consputc+0x10>
    8000724c:	00001317          	auipc	t1,0x1
    80007250:	9f430067          	jr	-1548(t1) # 80007c40 <uartputc_sync>
    80007254:	ff010113          	addi	sp,sp,-16
    80007258:	00113423          	sd	ra,8(sp)
    8000725c:	00813023          	sd	s0,0(sp)
    80007260:	01010413          	addi	s0,sp,16
    80007264:	00800513          	li	a0,8
    80007268:	00001097          	auipc	ra,0x1
    8000726c:	9d8080e7          	jalr	-1576(ra) # 80007c40 <uartputc_sync>
    80007270:	02000513          	li	a0,32
    80007274:	00001097          	auipc	ra,0x1
    80007278:	9cc080e7          	jalr	-1588(ra) # 80007c40 <uartputc_sync>
    8000727c:	00013403          	ld	s0,0(sp)
    80007280:	00813083          	ld	ra,8(sp)
    80007284:	00800513          	li	a0,8
    80007288:	01010113          	addi	sp,sp,16
    8000728c:	00001317          	auipc	t1,0x1
    80007290:	9b430067          	jr	-1612(t1) # 80007c40 <uartputc_sync>

0000000080007294 <consoleintr>:
    80007294:	fe010113          	addi	sp,sp,-32
    80007298:	00813823          	sd	s0,16(sp)
    8000729c:	00913423          	sd	s1,8(sp)
    800072a0:	01213023          	sd	s2,0(sp)
    800072a4:	00113c23          	sd	ra,24(sp)
    800072a8:	02010413          	addi	s0,sp,32
    800072ac:	00005917          	auipc	s2,0x5
    800072b0:	6dc90913          	addi	s2,s2,1756 # 8000c988 <cons>
    800072b4:	00050493          	mv	s1,a0
    800072b8:	00090513          	mv	a0,s2
    800072bc:	00001097          	auipc	ra,0x1
    800072c0:	e40080e7          	jalr	-448(ra) # 800080fc <acquire>
    800072c4:	02048c63          	beqz	s1,800072fc <consoleintr+0x68>
    800072c8:	0a092783          	lw	a5,160(s2)
    800072cc:	09892703          	lw	a4,152(s2)
    800072d0:	07f00693          	li	a3,127
    800072d4:	40e7873b          	subw	a4,a5,a4
    800072d8:	02e6e263          	bltu	a3,a4,800072fc <consoleintr+0x68>
    800072dc:	00d00713          	li	a4,13
    800072e0:	04e48063          	beq	s1,a4,80007320 <consoleintr+0x8c>
    800072e4:	07f7f713          	andi	a4,a5,127
    800072e8:	00e90733          	add	a4,s2,a4
    800072ec:	0017879b          	addiw	a5,a5,1
    800072f0:	0af92023          	sw	a5,160(s2)
    800072f4:	00970c23          	sb	s1,24(a4)
    800072f8:	08f92e23          	sw	a5,156(s2)
    800072fc:	01013403          	ld	s0,16(sp)
    80007300:	01813083          	ld	ra,24(sp)
    80007304:	00813483          	ld	s1,8(sp)
    80007308:	00013903          	ld	s2,0(sp)
    8000730c:	00005517          	auipc	a0,0x5
    80007310:	67c50513          	addi	a0,a0,1660 # 8000c988 <cons>
    80007314:	02010113          	addi	sp,sp,32
    80007318:	00001317          	auipc	t1,0x1
    8000731c:	eb030067          	jr	-336(t1) # 800081c8 <release>
    80007320:	00a00493          	li	s1,10
    80007324:	fc1ff06f          	j	800072e4 <consoleintr+0x50>

0000000080007328 <consoleinit>:
    80007328:	fe010113          	addi	sp,sp,-32
    8000732c:	00113c23          	sd	ra,24(sp)
    80007330:	00813823          	sd	s0,16(sp)
    80007334:	00913423          	sd	s1,8(sp)
    80007338:	02010413          	addi	s0,sp,32
    8000733c:	00005497          	auipc	s1,0x5
    80007340:	64c48493          	addi	s1,s1,1612 # 8000c988 <cons>
    80007344:	00048513          	mv	a0,s1
    80007348:	00002597          	auipc	a1,0x2
    8000734c:	28058593          	addi	a1,a1,640 # 800095c8 <CONSOLE_STATUS+0x5b8>
    80007350:	00001097          	auipc	ra,0x1
    80007354:	d88080e7          	jalr	-632(ra) # 800080d8 <initlock>
    80007358:	00000097          	auipc	ra,0x0
    8000735c:	7ac080e7          	jalr	1964(ra) # 80007b04 <uartinit>
    80007360:	01813083          	ld	ra,24(sp)
    80007364:	01013403          	ld	s0,16(sp)
    80007368:	00000797          	auipc	a5,0x0
    8000736c:	d9c78793          	addi	a5,a5,-612 # 80007104 <consoleread>
    80007370:	0af4bc23          	sd	a5,184(s1)
    80007374:	00000797          	auipc	a5,0x0
    80007378:	cec78793          	addi	a5,a5,-788 # 80007060 <consolewrite>
    8000737c:	0cf4b023          	sd	a5,192(s1)
    80007380:	00813483          	ld	s1,8(sp)
    80007384:	02010113          	addi	sp,sp,32
    80007388:	00008067          	ret

000000008000738c <console_read>:
    8000738c:	ff010113          	addi	sp,sp,-16
    80007390:	00813423          	sd	s0,8(sp)
    80007394:	01010413          	addi	s0,sp,16
    80007398:	00813403          	ld	s0,8(sp)
    8000739c:	00005317          	auipc	t1,0x5
    800073a0:	6a433303          	ld	t1,1700(t1) # 8000ca40 <devsw+0x10>
    800073a4:	01010113          	addi	sp,sp,16
    800073a8:	00030067          	jr	t1

00000000800073ac <console_write>:
    800073ac:	ff010113          	addi	sp,sp,-16
    800073b0:	00813423          	sd	s0,8(sp)
    800073b4:	01010413          	addi	s0,sp,16
    800073b8:	00813403          	ld	s0,8(sp)
    800073bc:	00005317          	auipc	t1,0x5
    800073c0:	68c33303          	ld	t1,1676(t1) # 8000ca48 <devsw+0x18>
    800073c4:	01010113          	addi	sp,sp,16
    800073c8:	00030067          	jr	t1

00000000800073cc <panic>:
    800073cc:	fe010113          	addi	sp,sp,-32
    800073d0:	00113c23          	sd	ra,24(sp)
    800073d4:	00813823          	sd	s0,16(sp)
    800073d8:	00913423          	sd	s1,8(sp)
    800073dc:	02010413          	addi	s0,sp,32
    800073e0:	00050493          	mv	s1,a0
    800073e4:	00002517          	auipc	a0,0x2
    800073e8:	1ec50513          	addi	a0,a0,492 # 800095d0 <CONSOLE_STATUS+0x5c0>
    800073ec:	00005797          	auipc	a5,0x5
    800073f0:	6e07ae23          	sw	zero,1788(a5) # 8000cae8 <pr+0x18>
    800073f4:	00000097          	auipc	ra,0x0
    800073f8:	034080e7          	jalr	52(ra) # 80007428 <__printf>
    800073fc:	00048513          	mv	a0,s1
    80007400:	00000097          	auipc	ra,0x0
    80007404:	028080e7          	jalr	40(ra) # 80007428 <__printf>
    80007408:	00002517          	auipc	a0,0x2
    8000740c:	f5050513          	addi	a0,a0,-176 # 80009358 <CONSOLE_STATUS+0x348>
    80007410:	00000097          	auipc	ra,0x0
    80007414:	018080e7          	jalr	24(ra) # 80007428 <__printf>
    80007418:	00100793          	li	a5,1
    8000741c:	00004717          	auipc	a4,0x4
    80007420:	3cf72623          	sw	a5,972(a4) # 8000b7e8 <panicked>
    80007424:	0000006f          	j	80007424 <panic+0x58>

0000000080007428 <__printf>:
    80007428:	f3010113          	addi	sp,sp,-208
    8000742c:	08813023          	sd	s0,128(sp)
    80007430:	07313423          	sd	s3,104(sp)
    80007434:	09010413          	addi	s0,sp,144
    80007438:	05813023          	sd	s8,64(sp)
    8000743c:	08113423          	sd	ra,136(sp)
    80007440:	06913c23          	sd	s1,120(sp)
    80007444:	07213823          	sd	s2,112(sp)
    80007448:	07413023          	sd	s4,96(sp)
    8000744c:	05513c23          	sd	s5,88(sp)
    80007450:	05613823          	sd	s6,80(sp)
    80007454:	05713423          	sd	s7,72(sp)
    80007458:	03913c23          	sd	s9,56(sp)
    8000745c:	03a13823          	sd	s10,48(sp)
    80007460:	03b13423          	sd	s11,40(sp)
    80007464:	00005317          	auipc	t1,0x5
    80007468:	66c30313          	addi	t1,t1,1644 # 8000cad0 <pr>
    8000746c:	01832c03          	lw	s8,24(t1)
    80007470:	00b43423          	sd	a1,8(s0)
    80007474:	00c43823          	sd	a2,16(s0)
    80007478:	00d43c23          	sd	a3,24(s0)
    8000747c:	02e43023          	sd	a4,32(s0)
    80007480:	02f43423          	sd	a5,40(s0)
    80007484:	03043823          	sd	a6,48(s0)
    80007488:	03143c23          	sd	a7,56(s0)
    8000748c:	00050993          	mv	s3,a0
    80007490:	4a0c1663          	bnez	s8,8000793c <__printf+0x514>
    80007494:	60098c63          	beqz	s3,80007aac <__printf+0x684>
    80007498:	0009c503          	lbu	a0,0(s3)
    8000749c:	00840793          	addi	a5,s0,8
    800074a0:	f6f43c23          	sd	a5,-136(s0)
    800074a4:	00000493          	li	s1,0
    800074a8:	22050063          	beqz	a0,800076c8 <__printf+0x2a0>
    800074ac:	00002a37          	lui	s4,0x2
    800074b0:	00018ab7          	lui	s5,0x18
    800074b4:	000f4b37          	lui	s6,0xf4
    800074b8:	00989bb7          	lui	s7,0x989
    800074bc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800074c0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800074c4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800074c8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800074cc:	00148c9b          	addiw	s9,s1,1
    800074d0:	02500793          	li	a5,37
    800074d4:	01998933          	add	s2,s3,s9
    800074d8:	38f51263          	bne	a0,a5,8000785c <__printf+0x434>
    800074dc:	00094783          	lbu	a5,0(s2)
    800074e0:	00078c9b          	sext.w	s9,a5
    800074e4:	1e078263          	beqz	a5,800076c8 <__printf+0x2a0>
    800074e8:	0024849b          	addiw	s1,s1,2
    800074ec:	07000713          	li	a4,112
    800074f0:	00998933          	add	s2,s3,s1
    800074f4:	38e78a63          	beq	a5,a4,80007888 <__printf+0x460>
    800074f8:	20f76863          	bltu	a4,a5,80007708 <__printf+0x2e0>
    800074fc:	42a78863          	beq	a5,a0,8000792c <__printf+0x504>
    80007500:	06400713          	li	a4,100
    80007504:	40e79663          	bne	a5,a4,80007910 <__printf+0x4e8>
    80007508:	f7843783          	ld	a5,-136(s0)
    8000750c:	0007a603          	lw	a2,0(a5)
    80007510:	00878793          	addi	a5,a5,8
    80007514:	f6f43c23          	sd	a5,-136(s0)
    80007518:	42064a63          	bltz	a2,8000794c <__printf+0x524>
    8000751c:	00a00713          	li	a4,10
    80007520:	02e677bb          	remuw	a5,a2,a4
    80007524:	00002d97          	auipc	s11,0x2
    80007528:	0d4d8d93          	addi	s11,s11,212 # 800095f8 <digits>
    8000752c:	00900593          	li	a1,9
    80007530:	0006051b          	sext.w	a0,a2
    80007534:	00000c93          	li	s9,0
    80007538:	02079793          	slli	a5,a5,0x20
    8000753c:	0207d793          	srli	a5,a5,0x20
    80007540:	00fd87b3          	add	a5,s11,a5
    80007544:	0007c783          	lbu	a5,0(a5)
    80007548:	02e656bb          	divuw	a3,a2,a4
    8000754c:	f8f40023          	sb	a5,-128(s0)
    80007550:	14c5d863          	bge	a1,a2,800076a0 <__printf+0x278>
    80007554:	06300593          	li	a1,99
    80007558:	00100c93          	li	s9,1
    8000755c:	02e6f7bb          	remuw	a5,a3,a4
    80007560:	02079793          	slli	a5,a5,0x20
    80007564:	0207d793          	srli	a5,a5,0x20
    80007568:	00fd87b3          	add	a5,s11,a5
    8000756c:	0007c783          	lbu	a5,0(a5)
    80007570:	02e6d73b          	divuw	a4,a3,a4
    80007574:	f8f400a3          	sb	a5,-127(s0)
    80007578:	12a5f463          	bgeu	a1,a0,800076a0 <__printf+0x278>
    8000757c:	00a00693          	li	a3,10
    80007580:	00900593          	li	a1,9
    80007584:	02d777bb          	remuw	a5,a4,a3
    80007588:	02079793          	slli	a5,a5,0x20
    8000758c:	0207d793          	srli	a5,a5,0x20
    80007590:	00fd87b3          	add	a5,s11,a5
    80007594:	0007c503          	lbu	a0,0(a5)
    80007598:	02d757bb          	divuw	a5,a4,a3
    8000759c:	f8a40123          	sb	a0,-126(s0)
    800075a0:	48e5f263          	bgeu	a1,a4,80007a24 <__printf+0x5fc>
    800075a4:	06300513          	li	a0,99
    800075a8:	02d7f5bb          	remuw	a1,a5,a3
    800075ac:	02059593          	slli	a1,a1,0x20
    800075b0:	0205d593          	srli	a1,a1,0x20
    800075b4:	00bd85b3          	add	a1,s11,a1
    800075b8:	0005c583          	lbu	a1,0(a1)
    800075bc:	02d7d7bb          	divuw	a5,a5,a3
    800075c0:	f8b401a3          	sb	a1,-125(s0)
    800075c4:	48e57263          	bgeu	a0,a4,80007a48 <__printf+0x620>
    800075c8:	3e700513          	li	a0,999
    800075cc:	02d7f5bb          	remuw	a1,a5,a3
    800075d0:	02059593          	slli	a1,a1,0x20
    800075d4:	0205d593          	srli	a1,a1,0x20
    800075d8:	00bd85b3          	add	a1,s11,a1
    800075dc:	0005c583          	lbu	a1,0(a1)
    800075e0:	02d7d7bb          	divuw	a5,a5,a3
    800075e4:	f8b40223          	sb	a1,-124(s0)
    800075e8:	46e57663          	bgeu	a0,a4,80007a54 <__printf+0x62c>
    800075ec:	02d7f5bb          	remuw	a1,a5,a3
    800075f0:	02059593          	slli	a1,a1,0x20
    800075f4:	0205d593          	srli	a1,a1,0x20
    800075f8:	00bd85b3          	add	a1,s11,a1
    800075fc:	0005c583          	lbu	a1,0(a1)
    80007600:	02d7d7bb          	divuw	a5,a5,a3
    80007604:	f8b402a3          	sb	a1,-123(s0)
    80007608:	46ea7863          	bgeu	s4,a4,80007a78 <__printf+0x650>
    8000760c:	02d7f5bb          	remuw	a1,a5,a3
    80007610:	02059593          	slli	a1,a1,0x20
    80007614:	0205d593          	srli	a1,a1,0x20
    80007618:	00bd85b3          	add	a1,s11,a1
    8000761c:	0005c583          	lbu	a1,0(a1)
    80007620:	02d7d7bb          	divuw	a5,a5,a3
    80007624:	f8b40323          	sb	a1,-122(s0)
    80007628:	3eeaf863          	bgeu	s5,a4,80007a18 <__printf+0x5f0>
    8000762c:	02d7f5bb          	remuw	a1,a5,a3
    80007630:	02059593          	slli	a1,a1,0x20
    80007634:	0205d593          	srli	a1,a1,0x20
    80007638:	00bd85b3          	add	a1,s11,a1
    8000763c:	0005c583          	lbu	a1,0(a1)
    80007640:	02d7d7bb          	divuw	a5,a5,a3
    80007644:	f8b403a3          	sb	a1,-121(s0)
    80007648:	42eb7e63          	bgeu	s6,a4,80007a84 <__printf+0x65c>
    8000764c:	02d7f5bb          	remuw	a1,a5,a3
    80007650:	02059593          	slli	a1,a1,0x20
    80007654:	0205d593          	srli	a1,a1,0x20
    80007658:	00bd85b3          	add	a1,s11,a1
    8000765c:	0005c583          	lbu	a1,0(a1)
    80007660:	02d7d7bb          	divuw	a5,a5,a3
    80007664:	f8b40423          	sb	a1,-120(s0)
    80007668:	42ebfc63          	bgeu	s7,a4,80007aa0 <__printf+0x678>
    8000766c:	02079793          	slli	a5,a5,0x20
    80007670:	0207d793          	srli	a5,a5,0x20
    80007674:	00fd8db3          	add	s11,s11,a5
    80007678:	000dc703          	lbu	a4,0(s11)
    8000767c:	00a00793          	li	a5,10
    80007680:	00900c93          	li	s9,9
    80007684:	f8e404a3          	sb	a4,-119(s0)
    80007688:	00065c63          	bgez	a2,800076a0 <__printf+0x278>
    8000768c:	f9040713          	addi	a4,s0,-112
    80007690:	00f70733          	add	a4,a4,a5
    80007694:	02d00693          	li	a3,45
    80007698:	fed70823          	sb	a3,-16(a4)
    8000769c:	00078c93          	mv	s9,a5
    800076a0:	f8040793          	addi	a5,s0,-128
    800076a4:	01978cb3          	add	s9,a5,s9
    800076a8:	f7f40d13          	addi	s10,s0,-129
    800076ac:	000cc503          	lbu	a0,0(s9)
    800076b0:	fffc8c93          	addi	s9,s9,-1
    800076b4:	00000097          	auipc	ra,0x0
    800076b8:	b90080e7          	jalr	-1136(ra) # 80007244 <consputc>
    800076bc:	ffac98e3          	bne	s9,s10,800076ac <__printf+0x284>
    800076c0:	00094503          	lbu	a0,0(s2)
    800076c4:	e00514e3          	bnez	a0,800074cc <__printf+0xa4>
    800076c8:	1a0c1663          	bnez	s8,80007874 <__printf+0x44c>
    800076cc:	08813083          	ld	ra,136(sp)
    800076d0:	08013403          	ld	s0,128(sp)
    800076d4:	07813483          	ld	s1,120(sp)
    800076d8:	07013903          	ld	s2,112(sp)
    800076dc:	06813983          	ld	s3,104(sp)
    800076e0:	06013a03          	ld	s4,96(sp)
    800076e4:	05813a83          	ld	s5,88(sp)
    800076e8:	05013b03          	ld	s6,80(sp)
    800076ec:	04813b83          	ld	s7,72(sp)
    800076f0:	04013c03          	ld	s8,64(sp)
    800076f4:	03813c83          	ld	s9,56(sp)
    800076f8:	03013d03          	ld	s10,48(sp)
    800076fc:	02813d83          	ld	s11,40(sp)
    80007700:	0d010113          	addi	sp,sp,208
    80007704:	00008067          	ret
    80007708:	07300713          	li	a4,115
    8000770c:	1ce78a63          	beq	a5,a4,800078e0 <__printf+0x4b8>
    80007710:	07800713          	li	a4,120
    80007714:	1ee79e63          	bne	a5,a4,80007910 <__printf+0x4e8>
    80007718:	f7843783          	ld	a5,-136(s0)
    8000771c:	0007a703          	lw	a4,0(a5)
    80007720:	00878793          	addi	a5,a5,8
    80007724:	f6f43c23          	sd	a5,-136(s0)
    80007728:	28074263          	bltz	a4,800079ac <__printf+0x584>
    8000772c:	00002d97          	auipc	s11,0x2
    80007730:	eccd8d93          	addi	s11,s11,-308 # 800095f8 <digits>
    80007734:	00f77793          	andi	a5,a4,15
    80007738:	00fd87b3          	add	a5,s11,a5
    8000773c:	0007c683          	lbu	a3,0(a5)
    80007740:	00f00613          	li	a2,15
    80007744:	0007079b          	sext.w	a5,a4
    80007748:	f8d40023          	sb	a3,-128(s0)
    8000774c:	0047559b          	srliw	a1,a4,0x4
    80007750:	0047569b          	srliw	a3,a4,0x4
    80007754:	00000c93          	li	s9,0
    80007758:	0ee65063          	bge	a2,a4,80007838 <__printf+0x410>
    8000775c:	00f6f693          	andi	a3,a3,15
    80007760:	00dd86b3          	add	a3,s11,a3
    80007764:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80007768:	0087d79b          	srliw	a5,a5,0x8
    8000776c:	00100c93          	li	s9,1
    80007770:	f8d400a3          	sb	a3,-127(s0)
    80007774:	0cb67263          	bgeu	a2,a1,80007838 <__printf+0x410>
    80007778:	00f7f693          	andi	a3,a5,15
    8000777c:	00dd86b3          	add	a3,s11,a3
    80007780:	0006c583          	lbu	a1,0(a3)
    80007784:	00f00613          	li	a2,15
    80007788:	0047d69b          	srliw	a3,a5,0x4
    8000778c:	f8b40123          	sb	a1,-126(s0)
    80007790:	0047d593          	srli	a1,a5,0x4
    80007794:	28f67e63          	bgeu	a2,a5,80007a30 <__printf+0x608>
    80007798:	00f6f693          	andi	a3,a3,15
    8000779c:	00dd86b3          	add	a3,s11,a3
    800077a0:	0006c503          	lbu	a0,0(a3)
    800077a4:	0087d813          	srli	a6,a5,0x8
    800077a8:	0087d69b          	srliw	a3,a5,0x8
    800077ac:	f8a401a3          	sb	a0,-125(s0)
    800077b0:	28b67663          	bgeu	a2,a1,80007a3c <__printf+0x614>
    800077b4:	00f6f693          	andi	a3,a3,15
    800077b8:	00dd86b3          	add	a3,s11,a3
    800077bc:	0006c583          	lbu	a1,0(a3)
    800077c0:	00c7d513          	srli	a0,a5,0xc
    800077c4:	00c7d69b          	srliw	a3,a5,0xc
    800077c8:	f8b40223          	sb	a1,-124(s0)
    800077cc:	29067a63          	bgeu	a2,a6,80007a60 <__printf+0x638>
    800077d0:	00f6f693          	andi	a3,a3,15
    800077d4:	00dd86b3          	add	a3,s11,a3
    800077d8:	0006c583          	lbu	a1,0(a3)
    800077dc:	0107d813          	srli	a6,a5,0x10
    800077e0:	0107d69b          	srliw	a3,a5,0x10
    800077e4:	f8b402a3          	sb	a1,-123(s0)
    800077e8:	28a67263          	bgeu	a2,a0,80007a6c <__printf+0x644>
    800077ec:	00f6f693          	andi	a3,a3,15
    800077f0:	00dd86b3          	add	a3,s11,a3
    800077f4:	0006c683          	lbu	a3,0(a3)
    800077f8:	0147d79b          	srliw	a5,a5,0x14
    800077fc:	f8d40323          	sb	a3,-122(s0)
    80007800:	21067663          	bgeu	a2,a6,80007a0c <__printf+0x5e4>
    80007804:	02079793          	slli	a5,a5,0x20
    80007808:	0207d793          	srli	a5,a5,0x20
    8000780c:	00fd8db3          	add	s11,s11,a5
    80007810:	000dc683          	lbu	a3,0(s11)
    80007814:	00800793          	li	a5,8
    80007818:	00700c93          	li	s9,7
    8000781c:	f8d403a3          	sb	a3,-121(s0)
    80007820:	00075c63          	bgez	a4,80007838 <__printf+0x410>
    80007824:	f9040713          	addi	a4,s0,-112
    80007828:	00f70733          	add	a4,a4,a5
    8000782c:	02d00693          	li	a3,45
    80007830:	fed70823          	sb	a3,-16(a4)
    80007834:	00078c93          	mv	s9,a5
    80007838:	f8040793          	addi	a5,s0,-128
    8000783c:	01978cb3          	add	s9,a5,s9
    80007840:	f7f40d13          	addi	s10,s0,-129
    80007844:	000cc503          	lbu	a0,0(s9)
    80007848:	fffc8c93          	addi	s9,s9,-1
    8000784c:	00000097          	auipc	ra,0x0
    80007850:	9f8080e7          	jalr	-1544(ra) # 80007244 <consputc>
    80007854:	ff9d18e3          	bne	s10,s9,80007844 <__printf+0x41c>
    80007858:	0100006f          	j	80007868 <__printf+0x440>
    8000785c:	00000097          	auipc	ra,0x0
    80007860:	9e8080e7          	jalr	-1560(ra) # 80007244 <consputc>
    80007864:	000c8493          	mv	s1,s9
    80007868:	00094503          	lbu	a0,0(s2)
    8000786c:	c60510e3          	bnez	a0,800074cc <__printf+0xa4>
    80007870:	e40c0ee3          	beqz	s8,800076cc <__printf+0x2a4>
    80007874:	00005517          	auipc	a0,0x5
    80007878:	25c50513          	addi	a0,a0,604 # 8000cad0 <pr>
    8000787c:	00001097          	auipc	ra,0x1
    80007880:	94c080e7          	jalr	-1716(ra) # 800081c8 <release>
    80007884:	e49ff06f          	j	800076cc <__printf+0x2a4>
    80007888:	f7843783          	ld	a5,-136(s0)
    8000788c:	03000513          	li	a0,48
    80007890:	01000d13          	li	s10,16
    80007894:	00878713          	addi	a4,a5,8
    80007898:	0007bc83          	ld	s9,0(a5)
    8000789c:	f6e43c23          	sd	a4,-136(s0)
    800078a0:	00000097          	auipc	ra,0x0
    800078a4:	9a4080e7          	jalr	-1628(ra) # 80007244 <consputc>
    800078a8:	07800513          	li	a0,120
    800078ac:	00000097          	auipc	ra,0x0
    800078b0:	998080e7          	jalr	-1640(ra) # 80007244 <consputc>
    800078b4:	00002d97          	auipc	s11,0x2
    800078b8:	d44d8d93          	addi	s11,s11,-700 # 800095f8 <digits>
    800078bc:	03ccd793          	srli	a5,s9,0x3c
    800078c0:	00fd87b3          	add	a5,s11,a5
    800078c4:	0007c503          	lbu	a0,0(a5)
    800078c8:	fffd0d1b          	addiw	s10,s10,-1
    800078cc:	004c9c93          	slli	s9,s9,0x4
    800078d0:	00000097          	auipc	ra,0x0
    800078d4:	974080e7          	jalr	-1676(ra) # 80007244 <consputc>
    800078d8:	fe0d12e3          	bnez	s10,800078bc <__printf+0x494>
    800078dc:	f8dff06f          	j	80007868 <__printf+0x440>
    800078e0:	f7843783          	ld	a5,-136(s0)
    800078e4:	0007bc83          	ld	s9,0(a5)
    800078e8:	00878793          	addi	a5,a5,8
    800078ec:	f6f43c23          	sd	a5,-136(s0)
    800078f0:	000c9a63          	bnez	s9,80007904 <__printf+0x4dc>
    800078f4:	1080006f          	j	800079fc <__printf+0x5d4>
    800078f8:	001c8c93          	addi	s9,s9,1
    800078fc:	00000097          	auipc	ra,0x0
    80007900:	948080e7          	jalr	-1720(ra) # 80007244 <consputc>
    80007904:	000cc503          	lbu	a0,0(s9)
    80007908:	fe0518e3          	bnez	a0,800078f8 <__printf+0x4d0>
    8000790c:	f5dff06f          	j	80007868 <__printf+0x440>
    80007910:	02500513          	li	a0,37
    80007914:	00000097          	auipc	ra,0x0
    80007918:	930080e7          	jalr	-1744(ra) # 80007244 <consputc>
    8000791c:	000c8513          	mv	a0,s9
    80007920:	00000097          	auipc	ra,0x0
    80007924:	924080e7          	jalr	-1756(ra) # 80007244 <consputc>
    80007928:	f41ff06f          	j	80007868 <__printf+0x440>
    8000792c:	02500513          	li	a0,37
    80007930:	00000097          	auipc	ra,0x0
    80007934:	914080e7          	jalr	-1772(ra) # 80007244 <consputc>
    80007938:	f31ff06f          	j	80007868 <__printf+0x440>
    8000793c:	00030513          	mv	a0,t1
    80007940:	00000097          	auipc	ra,0x0
    80007944:	7bc080e7          	jalr	1980(ra) # 800080fc <acquire>
    80007948:	b4dff06f          	j	80007494 <__printf+0x6c>
    8000794c:	40c0053b          	negw	a0,a2
    80007950:	00a00713          	li	a4,10
    80007954:	02e576bb          	remuw	a3,a0,a4
    80007958:	00002d97          	auipc	s11,0x2
    8000795c:	ca0d8d93          	addi	s11,s11,-864 # 800095f8 <digits>
    80007960:	ff700593          	li	a1,-9
    80007964:	02069693          	slli	a3,a3,0x20
    80007968:	0206d693          	srli	a3,a3,0x20
    8000796c:	00dd86b3          	add	a3,s11,a3
    80007970:	0006c683          	lbu	a3,0(a3)
    80007974:	02e557bb          	divuw	a5,a0,a4
    80007978:	f8d40023          	sb	a3,-128(s0)
    8000797c:	10b65e63          	bge	a2,a1,80007a98 <__printf+0x670>
    80007980:	06300593          	li	a1,99
    80007984:	02e7f6bb          	remuw	a3,a5,a4
    80007988:	02069693          	slli	a3,a3,0x20
    8000798c:	0206d693          	srli	a3,a3,0x20
    80007990:	00dd86b3          	add	a3,s11,a3
    80007994:	0006c683          	lbu	a3,0(a3)
    80007998:	02e7d73b          	divuw	a4,a5,a4
    8000799c:	00200793          	li	a5,2
    800079a0:	f8d400a3          	sb	a3,-127(s0)
    800079a4:	bca5ece3          	bltu	a1,a0,8000757c <__printf+0x154>
    800079a8:	ce5ff06f          	j	8000768c <__printf+0x264>
    800079ac:	40e007bb          	negw	a5,a4
    800079b0:	00002d97          	auipc	s11,0x2
    800079b4:	c48d8d93          	addi	s11,s11,-952 # 800095f8 <digits>
    800079b8:	00f7f693          	andi	a3,a5,15
    800079bc:	00dd86b3          	add	a3,s11,a3
    800079c0:	0006c583          	lbu	a1,0(a3)
    800079c4:	ff100613          	li	a2,-15
    800079c8:	0047d69b          	srliw	a3,a5,0x4
    800079cc:	f8b40023          	sb	a1,-128(s0)
    800079d0:	0047d59b          	srliw	a1,a5,0x4
    800079d4:	0ac75e63          	bge	a4,a2,80007a90 <__printf+0x668>
    800079d8:	00f6f693          	andi	a3,a3,15
    800079dc:	00dd86b3          	add	a3,s11,a3
    800079e0:	0006c603          	lbu	a2,0(a3)
    800079e4:	00f00693          	li	a3,15
    800079e8:	0087d79b          	srliw	a5,a5,0x8
    800079ec:	f8c400a3          	sb	a2,-127(s0)
    800079f0:	d8b6e4e3          	bltu	a3,a1,80007778 <__printf+0x350>
    800079f4:	00200793          	li	a5,2
    800079f8:	e2dff06f          	j	80007824 <__printf+0x3fc>
    800079fc:	00002c97          	auipc	s9,0x2
    80007a00:	bdcc8c93          	addi	s9,s9,-1060 # 800095d8 <CONSOLE_STATUS+0x5c8>
    80007a04:	02800513          	li	a0,40
    80007a08:	ef1ff06f          	j	800078f8 <__printf+0x4d0>
    80007a0c:	00700793          	li	a5,7
    80007a10:	00600c93          	li	s9,6
    80007a14:	e0dff06f          	j	80007820 <__printf+0x3f8>
    80007a18:	00700793          	li	a5,7
    80007a1c:	00600c93          	li	s9,6
    80007a20:	c69ff06f          	j	80007688 <__printf+0x260>
    80007a24:	00300793          	li	a5,3
    80007a28:	00200c93          	li	s9,2
    80007a2c:	c5dff06f          	j	80007688 <__printf+0x260>
    80007a30:	00300793          	li	a5,3
    80007a34:	00200c93          	li	s9,2
    80007a38:	de9ff06f          	j	80007820 <__printf+0x3f8>
    80007a3c:	00400793          	li	a5,4
    80007a40:	00300c93          	li	s9,3
    80007a44:	dddff06f          	j	80007820 <__printf+0x3f8>
    80007a48:	00400793          	li	a5,4
    80007a4c:	00300c93          	li	s9,3
    80007a50:	c39ff06f          	j	80007688 <__printf+0x260>
    80007a54:	00500793          	li	a5,5
    80007a58:	00400c93          	li	s9,4
    80007a5c:	c2dff06f          	j	80007688 <__printf+0x260>
    80007a60:	00500793          	li	a5,5
    80007a64:	00400c93          	li	s9,4
    80007a68:	db9ff06f          	j	80007820 <__printf+0x3f8>
    80007a6c:	00600793          	li	a5,6
    80007a70:	00500c93          	li	s9,5
    80007a74:	dadff06f          	j	80007820 <__printf+0x3f8>
    80007a78:	00600793          	li	a5,6
    80007a7c:	00500c93          	li	s9,5
    80007a80:	c09ff06f          	j	80007688 <__printf+0x260>
    80007a84:	00800793          	li	a5,8
    80007a88:	00700c93          	li	s9,7
    80007a8c:	bfdff06f          	j	80007688 <__printf+0x260>
    80007a90:	00100793          	li	a5,1
    80007a94:	d91ff06f          	j	80007824 <__printf+0x3fc>
    80007a98:	00100793          	li	a5,1
    80007a9c:	bf1ff06f          	j	8000768c <__printf+0x264>
    80007aa0:	00900793          	li	a5,9
    80007aa4:	00800c93          	li	s9,8
    80007aa8:	be1ff06f          	j	80007688 <__printf+0x260>
    80007aac:	00002517          	auipc	a0,0x2
    80007ab0:	b3450513          	addi	a0,a0,-1228 # 800095e0 <CONSOLE_STATUS+0x5d0>
    80007ab4:	00000097          	auipc	ra,0x0
    80007ab8:	918080e7          	jalr	-1768(ra) # 800073cc <panic>

0000000080007abc <printfinit>:
    80007abc:	fe010113          	addi	sp,sp,-32
    80007ac0:	00813823          	sd	s0,16(sp)
    80007ac4:	00913423          	sd	s1,8(sp)
    80007ac8:	00113c23          	sd	ra,24(sp)
    80007acc:	02010413          	addi	s0,sp,32
    80007ad0:	00005497          	auipc	s1,0x5
    80007ad4:	00048493          	mv	s1,s1
    80007ad8:	00048513          	mv	a0,s1
    80007adc:	00002597          	auipc	a1,0x2
    80007ae0:	b1458593          	addi	a1,a1,-1260 # 800095f0 <CONSOLE_STATUS+0x5e0>
    80007ae4:	00000097          	auipc	ra,0x0
    80007ae8:	5f4080e7          	jalr	1524(ra) # 800080d8 <initlock>
    80007aec:	01813083          	ld	ra,24(sp)
    80007af0:	01013403          	ld	s0,16(sp)
    80007af4:	0004ac23          	sw	zero,24(s1) # 8000cae8 <pr+0x18>
    80007af8:	00813483          	ld	s1,8(sp)
    80007afc:	02010113          	addi	sp,sp,32
    80007b00:	00008067          	ret

0000000080007b04 <uartinit>:
    80007b04:	ff010113          	addi	sp,sp,-16
    80007b08:	00813423          	sd	s0,8(sp)
    80007b0c:	01010413          	addi	s0,sp,16
    80007b10:	100007b7          	lui	a5,0x10000
    80007b14:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80007b18:	f8000713          	li	a4,-128
    80007b1c:	00e781a3          	sb	a4,3(a5)
    80007b20:	00300713          	li	a4,3
    80007b24:	00e78023          	sb	a4,0(a5)
    80007b28:	000780a3          	sb	zero,1(a5)
    80007b2c:	00e781a3          	sb	a4,3(a5)
    80007b30:	00700693          	li	a3,7
    80007b34:	00d78123          	sb	a3,2(a5)
    80007b38:	00e780a3          	sb	a4,1(a5)
    80007b3c:	00813403          	ld	s0,8(sp)
    80007b40:	01010113          	addi	sp,sp,16
    80007b44:	00008067          	ret

0000000080007b48 <uartputc>:
    80007b48:	00004797          	auipc	a5,0x4
    80007b4c:	ca07a783          	lw	a5,-864(a5) # 8000b7e8 <panicked>
    80007b50:	00078463          	beqz	a5,80007b58 <uartputc+0x10>
    80007b54:	0000006f          	j	80007b54 <uartputc+0xc>
    80007b58:	fd010113          	addi	sp,sp,-48
    80007b5c:	02813023          	sd	s0,32(sp)
    80007b60:	00913c23          	sd	s1,24(sp)
    80007b64:	01213823          	sd	s2,16(sp)
    80007b68:	01313423          	sd	s3,8(sp)
    80007b6c:	02113423          	sd	ra,40(sp)
    80007b70:	03010413          	addi	s0,sp,48
    80007b74:	00004917          	auipc	s2,0x4
    80007b78:	c7c90913          	addi	s2,s2,-900 # 8000b7f0 <uart_tx_r>
    80007b7c:	00093783          	ld	a5,0(s2)
    80007b80:	00004497          	auipc	s1,0x4
    80007b84:	c7848493          	addi	s1,s1,-904 # 8000b7f8 <uart_tx_w>
    80007b88:	0004b703          	ld	a4,0(s1)
    80007b8c:	02078693          	addi	a3,a5,32
    80007b90:	00050993          	mv	s3,a0
    80007b94:	02e69c63          	bne	a3,a4,80007bcc <uartputc+0x84>
    80007b98:	00001097          	auipc	ra,0x1
    80007b9c:	834080e7          	jalr	-1996(ra) # 800083cc <push_on>
    80007ba0:	00093783          	ld	a5,0(s2)
    80007ba4:	0004b703          	ld	a4,0(s1)
    80007ba8:	02078793          	addi	a5,a5,32
    80007bac:	00e79463          	bne	a5,a4,80007bb4 <uartputc+0x6c>
    80007bb0:	0000006f          	j	80007bb0 <uartputc+0x68>
    80007bb4:	00001097          	auipc	ra,0x1
    80007bb8:	88c080e7          	jalr	-1908(ra) # 80008440 <pop_on>
    80007bbc:	00093783          	ld	a5,0(s2)
    80007bc0:	0004b703          	ld	a4,0(s1)
    80007bc4:	02078693          	addi	a3,a5,32
    80007bc8:	fce688e3          	beq	a3,a4,80007b98 <uartputc+0x50>
    80007bcc:	01f77693          	andi	a3,a4,31
    80007bd0:	00005597          	auipc	a1,0x5
    80007bd4:	f2058593          	addi	a1,a1,-224 # 8000caf0 <uart_tx_buf>
    80007bd8:	00d586b3          	add	a3,a1,a3
    80007bdc:	00170713          	addi	a4,a4,1
    80007be0:	01368023          	sb	s3,0(a3)
    80007be4:	00e4b023          	sd	a4,0(s1)
    80007be8:	10000637          	lui	a2,0x10000
    80007bec:	02f71063          	bne	a4,a5,80007c0c <uartputc+0xc4>
    80007bf0:	0340006f          	j	80007c24 <uartputc+0xdc>
    80007bf4:	00074703          	lbu	a4,0(a4)
    80007bf8:	00f93023          	sd	a5,0(s2)
    80007bfc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80007c00:	00093783          	ld	a5,0(s2)
    80007c04:	0004b703          	ld	a4,0(s1)
    80007c08:	00f70e63          	beq	a4,a5,80007c24 <uartputc+0xdc>
    80007c0c:	00564683          	lbu	a3,5(a2)
    80007c10:	01f7f713          	andi	a4,a5,31
    80007c14:	00e58733          	add	a4,a1,a4
    80007c18:	0206f693          	andi	a3,a3,32
    80007c1c:	00178793          	addi	a5,a5,1
    80007c20:	fc069ae3          	bnez	a3,80007bf4 <uartputc+0xac>
    80007c24:	02813083          	ld	ra,40(sp)
    80007c28:	02013403          	ld	s0,32(sp)
    80007c2c:	01813483          	ld	s1,24(sp)
    80007c30:	01013903          	ld	s2,16(sp)
    80007c34:	00813983          	ld	s3,8(sp)
    80007c38:	03010113          	addi	sp,sp,48
    80007c3c:	00008067          	ret

0000000080007c40 <uartputc_sync>:
    80007c40:	ff010113          	addi	sp,sp,-16
    80007c44:	00813423          	sd	s0,8(sp)
    80007c48:	01010413          	addi	s0,sp,16
    80007c4c:	00004717          	auipc	a4,0x4
    80007c50:	b9c72703          	lw	a4,-1124(a4) # 8000b7e8 <panicked>
    80007c54:	02071663          	bnez	a4,80007c80 <uartputc_sync+0x40>
    80007c58:	00050793          	mv	a5,a0
    80007c5c:	100006b7          	lui	a3,0x10000
    80007c60:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80007c64:	02077713          	andi	a4,a4,32
    80007c68:	fe070ce3          	beqz	a4,80007c60 <uartputc_sync+0x20>
    80007c6c:	0ff7f793          	andi	a5,a5,255
    80007c70:	00f68023          	sb	a5,0(a3)
    80007c74:	00813403          	ld	s0,8(sp)
    80007c78:	01010113          	addi	sp,sp,16
    80007c7c:	00008067          	ret
    80007c80:	0000006f          	j	80007c80 <uartputc_sync+0x40>

0000000080007c84 <uartstart>:
    80007c84:	ff010113          	addi	sp,sp,-16
    80007c88:	00813423          	sd	s0,8(sp)
    80007c8c:	01010413          	addi	s0,sp,16
    80007c90:	00004617          	auipc	a2,0x4
    80007c94:	b6060613          	addi	a2,a2,-1184 # 8000b7f0 <uart_tx_r>
    80007c98:	00004517          	auipc	a0,0x4
    80007c9c:	b6050513          	addi	a0,a0,-1184 # 8000b7f8 <uart_tx_w>
    80007ca0:	00063783          	ld	a5,0(a2)
    80007ca4:	00053703          	ld	a4,0(a0)
    80007ca8:	04f70263          	beq	a4,a5,80007cec <uartstart+0x68>
    80007cac:	100005b7          	lui	a1,0x10000
    80007cb0:	00005817          	auipc	a6,0x5
    80007cb4:	e4080813          	addi	a6,a6,-448 # 8000caf0 <uart_tx_buf>
    80007cb8:	01c0006f          	j	80007cd4 <uartstart+0x50>
    80007cbc:	0006c703          	lbu	a4,0(a3)
    80007cc0:	00f63023          	sd	a5,0(a2)
    80007cc4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80007cc8:	00063783          	ld	a5,0(a2)
    80007ccc:	00053703          	ld	a4,0(a0)
    80007cd0:	00f70e63          	beq	a4,a5,80007cec <uartstart+0x68>
    80007cd4:	01f7f713          	andi	a4,a5,31
    80007cd8:	00e806b3          	add	a3,a6,a4
    80007cdc:	0055c703          	lbu	a4,5(a1)
    80007ce0:	00178793          	addi	a5,a5,1
    80007ce4:	02077713          	andi	a4,a4,32
    80007ce8:	fc071ae3          	bnez	a4,80007cbc <uartstart+0x38>
    80007cec:	00813403          	ld	s0,8(sp)
    80007cf0:	01010113          	addi	sp,sp,16
    80007cf4:	00008067          	ret

0000000080007cf8 <uartgetc>:
    80007cf8:	ff010113          	addi	sp,sp,-16
    80007cfc:	00813423          	sd	s0,8(sp)
    80007d00:	01010413          	addi	s0,sp,16
    80007d04:	10000737          	lui	a4,0x10000
    80007d08:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80007d0c:	0017f793          	andi	a5,a5,1
    80007d10:	00078c63          	beqz	a5,80007d28 <uartgetc+0x30>
    80007d14:	00074503          	lbu	a0,0(a4)
    80007d18:	0ff57513          	andi	a0,a0,255
    80007d1c:	00813403          	ld	s0,8(sp)
    80007d20:	01010113          	addi	sp,sp,16
    80007d24:	00008067          	ret
    80007d28:	fff00513          	li	a0,-1
    80007d2c:	ff1ff06f          	j	80007d1c <uartgetc+0x24>

0000000080007d30 <uartintr>:
    80007d30:	100007b7          	lui	a5,0x10000
    80007d34:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80007d38:	0017f793          	andi	a5,a5,1
    80007d3c:	0a078463          	beqz	a5,80007de4 <uartintr+0xb4>
    80007d40:	fe010113          	addi	sp,sp,-32
    80007d44:	00813823          	sd	s0,16(sp)
    80007d48:	00913423          	sd	s1,8(sp)
    80007d4c:	00113c23          	sd	ra,24(sp)
    80007d50:	02010413          	addi	s0,sp,32
    80007d54:	100004b7          	lui	s1,0x10000
    80007d58:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80007d5c:	0ff57513          	andi	a0,a0,255
    80007d60:	fffff097          	auipc	ra,0xfffff
    80007d64:	534080e7          	jalr	1332(ra) # 80007294 <consoleintr>
    80007d68:	0054c783          	lbu	a5,5(s1)
    80007d6c:	0017f793          	andi	a5,a5,1
    80007d70:	fe0794e3          	bnez	a5,80007d58 <uartintr+0x28>
    80007d74:	00004617          	auipc	a2,0x4
    80007d78:	a7c60613          	addi	a2,a2,-1412 # 8000b7f0 <uart_tx_r>
    80007d7c:	00004517          	auipc	a0,0x4
    80007d80:	a7c50513          	addi	a0,a0,-1412 # 8000b7f8 <uart_tx_w>
    80007d84:	00063783          	ld	a5,0(a2)
    80007d88:	00053703          	ld	a4,0(a0)
    80007d8c:	04f70263          	beq	a4,a5,80007dd0 <uartintr+0xa0>
    80007d90:	100005b7          	lui	a1,0x10000
    80007d94:	00005817          	auipc	a6,0x5
    80007d98:	d5c80813          	addi	a6,a6,-676 # 8000caf0 <uart_tx_buf>
    80007d9c:	01c0006f          	j	80007db8 <uartintr+0x88>
    80007da0:	0006c703          	lbu	a4,0(a3)
    80007da4:	00f63023          	sd	a5,0(a2)
    80007da8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80007dac:	00063783          	ld	a5,0(a2)
    80007db0:	00053703          	ld	a4,0(a0)
    80007db4:	00f70e63          	beq	a4,a5,80007dd0 <uartintr+0xa0>
    80007db8:	01f7f713          	andi	a4,a5,31
    80007dbc:	00e806b3          	add	a3,a6,a4
    80007dc0:	0055c703          	lbu	a4,5(a1)
    80007dc4:	00178793          	addi	a5,a5,1
    80007dc8:	02077713          	andi	a4,a4,32
    80007dcc:	fc071ae3          	bnez	a4,80007da0 <uartintr+0x70>
    80007dd0:	01813083          	ld	ra,24(sp)
    80007dd4:	01013403          	ld	s0,16(sp)
    80007dd8:	00813483          	ld	s1,8(sp)
    80007ddc:	02010113          	addi	sp,sp,32
    80007de0:	00008067          	ret
    80007de4:	00004617          	auipc	a2,0x4
    80007de8:	a0c60613          	addi	a2,a2,-1524 # 8000b7f0 <uart_tx_r>
    80007dec:	00004517          	auipc	a0,0x4
    80007df0:	a0c50513          	addi	a0,a0,-1524 # 8000b7f8 <uart_tx_w>
    80007df4:	00063783          	ld	a5,0(a2)
    80007df8:	00053703          	ld	a4,0(a0)
    80007dfc:	04f70263          	beq	a4,a5,80007e40 <uartintr+0x110>
    80007e00:	100005b7          	lui	a1,0x10000
    80007e04:	00005817          	auipc	a6,0x5
    80007e08:	cec80813          	addi	a6,a6,-788 # 8000caf0 <uart_tx_buf>
    80007e0c:	01c0006f          	j	80007e28 <uartintr+0xf8>
    80007e10:	0006c703          	lbu	a4,0(a3)
    80007e14:	00f63023          	sd	a5,0(a2)
    80007e18:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80007e1c:	00063783          	ld	a5,0(a2)
    80007e20:	00053703          	ld	a4,0(a0)
    80007e24:	02f70063          	beq	a4,a5,80007e44 <uartintr+0x114>
    80007e28:	01f7f713          	andi	a4,a5,31
    80007e2c:	00e806b3          	add	a3,a6,a4
    80007e30:	0055c703          	lbu	a4,5(a1)
    80007e34:	00178793          	addi	a5,a5,1
    80007e38:	02077713          	andi	a4,a4,32
    80007e3c:	fc071ae3          	bnez	a4,80007e10 <uartintr+0xe0>
    80007e40:	00008067          	ret
    80007e44:	00008067          	ret

0000000080007e48 <kinit>:
    80007e48:	fc010113          	addi	sp,sp,-64
    80007e4c:	02913423          	sd	s1,40(sp)
    80007e50:	fffff7b7          	lui	a5,0xfffff
    80007e54:	00006497          	auipc	s1,0x6
    80007e58:	cbb48493          	addi	s1,s1,-837 # 8000db0f <end+0xfff>
    80007e5c:	02813823          	sd	s0,48(sp)
    80007e60:	01313c23          	sd	s3,24(sp)
    80007e64:	00f4f4b3          	and	s1,s1,a5
    80007e68:	02113c23          	sd	ra,56(sp)
    80007e6c:	03213023          	sd	s2,32(sp)
    80007e70:	01413823          	sd	s4,16(sp)
    80007e74:	01513423          	sd	s5,8(sp)
    80007e78:	04010413          	addi	s0,sp,64
    80007e7c:	000017b7          	lui	a5,0x1
    80007e80:	01100993          	li	s3,17
    80007e84:	00f487b3          	add	a5,s1,a5
    80007e88:	01b99993          	slli	s3,s3,0x1b
    80007e8c:	06f9e063          	bltu	s3,a5,80007eec <kinit+0xa4>
    80007e90:	00005a97          	auipc	s5,0x5
    80007e94:	c80a8a93          	addi	s5,s5,-896 # 8000cb10 <end>
    80007e98:	0754ec63          	bltu	s1,s5,80007f10 <kinit+0xc8>
    80007e9c:	0734fa63          	bgeu	s1,s3,80007f10 <kinit+0xc8>
    80007ea0:	00088a37          	lui	s4,0x88
    80007ea4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80007ea8:	00004917          	auipc	s2,0x4
    80007eac:	95890913          	addi	s2,s2,-1704 # 8000b800 <kmem>
    80007eb0:	00ca1a13          	slli	s4,s4,0xc
    80007eb4:	0140006f          	j	80007ec8 <kinit+0x80>
    80007eb8:	000017b7          	lui	a5,0x1
    80007ebc:	00f484b3          	add	s1,s1,a5
    80007ec0:	0554e863          	bltu	s1,s5,80007f10 <kinit+0xc8>
    80007ec4:	0534f663          	bgeu	s1,s3,80007f10 <kinit+0xc8>
    80007ec8:	00001637          	lui	a2,0x1
    80007ecc:	00100593          	li	a1,1
    80007ed0:	00048513          	mv	a0,s1
    80007ed4:	00000097          	auipc	ra,0x0
    80007ed8:	5e4080e7          	jalr	1508(ra) # 800084b8 <__memset>
    80007edc:	00093783          	ld	a5,0(s2)
    80007ee0:	00f4b023          	sd	a5,0(s1)
    80007ee4:	00993023          	sd	s1,0(s2)
    80007ee8:	fd4498e3          	bne	s1,s4,80007eb8 <kinit+0x70>
    80007eec:	03813083          	ld	ra,56(sp)
    80007ef0:	03013403          	ld	s0,48(sp)
    80007ef4:	02813483          	ld	s1,40(sp)
    80007ef8:	02013903          	ld	s2,32(sp)
    80007efc:	01813983          	ld	s3,24(sp)
    80007f00:	01013a03          	ld	s4,16(sp)
    80007f04:	00813a83          	ld	s5,8(sp)
    80007f08:	04010113          	addi	sp,sp,64
    80007f0c:	00008067          	ret
    80007f10:	00001517          	auipc	a0,0x1
    80007f14:	70050513          	addi	a0,a0,1792 # 80009610 <digits+0x18>
    80007f18:	fffff097          	auipc	ra,0xfffff
    80007f1c:	4b4080e7          	jalr	1204(ra) # 800073cc <panic>

0000000080007f20 <freerange>:
    80007f20:	fc010113          	addi	sp,sp,-64
    80007f24:	000017b7          	lui	a5,0x1
    80007f28:	02913423          	sd	s1,40(sp)
    80007f2c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80007f30:	009504b3          	add	s1,a0,s1
    80007f34:	fffff537          	lui	a0,0xfffff
    80007f38:	02813823          	sd	s0,48(sp)
    80007f3c:	02113c23          	sd	ra,56(sp)
    80007f40:	03213023          	sd	s2,32(sp)
    80007f44:	01313c23          	sd	s3,24(sp)
    80007f48:	01413823          	sd	s4,16(sp)
    80007f4c:	01513423          	sd	s5,8(sp)
    80007f50:	01613023          	sd	s6,0(sp)
    80007f54:	04010413          	addi	s0,sp,64
    80007f58:	00a4f4b3          	and	s1,s1,a0
    80007f5c:	00f487b3          	add	a5,s1,a5
    80007f60:	06f5e463          	bltu	a1,a5,80007fc8 <freerange+0xa8>
    80007f64:	00005a97          	auipc	s5,0x5
    80007f68:	baca8a93          	addi	s5,s5,-1108 # 8000cb10 <end>
    80007f6c:	0954e263          	bltu	s1,s5,80007ff0 <freerange+0xd0>
    80007f70:	01100993          	li	s3,17
    80007f74:	01b99993          	slli	s3,s3,0x1b
    80007f78:	0734fc63          	bgeu	s1,s3,80007ff0 <freerange+0xd0>
    80007f7c:	00058a13          	mv	s4,a1
    80007f80:	00004917          	auipc	s2,0x4
    80007f84:	88090913          	addi	s2,s2,-1920 # 8000b800 <kmem>
    80007f88:	00002b37          	lui	s6,0x2
    80007f8c:	0140006f          	j	80007fa0 <freerange+0x80>
    80007f90:	000017b7          	lui	a5,0x1
    80007f94:	00f484b3          	add	s1,s1,a5
    80007f98:	0554ec63          	bltu	s1,s5,80007ff0 <freerange+0xd0>
    80007f9c:	0534fa63          	bgeu	s1,s3,80007ff0 <freerange+0xd0>
    80007fa0:	00001637          	lui	a2,0x1
    80007fa4:	00100593          	li	a1,1
    80007fa8:	00048513          	mv	a0,s1
    80007fac:	00000097          	auipc	ra,0x0
    80007fb0:	50c080e7          	jalr	1292(ra) # 800084b8 <__memset>
    80007fb4:	00093703          	ld	a4,0(s2)
    80007fb8:	016487b3          	add	a5,s1,s6
    80007fbc:	00e4b023          	sd	a4,0(s1)
    80007fc0:	00993023          	sd	s1,0(s2)
    80007fc4:	fcfa76e3          	bgeu	s4,a5,80007f90 <freerange+0x70>
    80007fc8:	03813083          	ld	ra,56(sp)
    80007fcc:	03013403          	ld	s0,48(sp)
    80007fd0:	02813483          	ld	s1,40(sp)
    80007fd4:	02013903          	ld	s2,32(sp)
    80007fd8:	01813983          	ld	s3,24(sp)
    80007fdc:	01013a03          	ld	s4,16(sp)
    80007fe0:	00813a83          	ld	s5,8(sp)
    80007fe4:	00013b03          	ld	s6,0(sp)
    80007fe8:	04010113          	addi	sp,sp,64
    80007fec:	00008067          	ret
    80007ff0:	00001517          	auipc	a0,0x1
    80007ff4:	62050513          	addi	a0,a0,1568 # 80009610 <digits+0x18>
    80007ff8:	fffff097          	auipc	ra,0xfffff
    80007ffc:	3d4080e7          	jalr	980(ra) # 800073cc <panic>

0000000080008000 <kfree>:
    80008000:	fe010113          	addi	sp,sp,-32
    80008004:	00813823          	sd	s0,16(sp)
    80008008:	00113c23          	sd	ra,24(sp)
    8000800c:	00913423          	sd	s1,8(sp)
    80008010:	02010413          	addi	s0,sp,32
    80008014:	03451793          	slli	a5,a0,0x34
    80008018:	04079c63          	bnez	a5,80008070 <kfree+0x70>
    8000801c:	00005797          	auipc	a5,0x5
    80008020:	af478793          	addi	a5,a5,-1292 # 8000cb10 <end>
    80008024:	00050493          	mv	s1,a0
    80008028:	04f56463          	bltu	a0,a5,80008070 <kfree+0x70>
    8000802c:	01100793          	li	a5,17
    80008030:	01b79793          	slli	a5,a5,0x1b
    80008034:	02f57e63          	bgeu	a0,a5,80008070 <kfree+0x70>
    80008038:	00001637          	lui	a2,0x1
    8000803c:	00100593          	li	a1,1
    80008040:	00000097          	auipc	ra,0x0
    80008044:	478080e7          	jalr	1144(ra) # 800084b8 <__memset>
    80008048:	00003797          	auipc	a5,0x3
    8000804c:	7b878793          	addi	a5,a5,1976 # 8000b800 <kmem>
    80008050:	0007b703          	ld	a4,0(a5)
    80008054:	01813083          	ld	ra,24(sp)
    80008058:	01013403          	ld	s0,16(sp)
    8000805c:	00e4b023          	sd	a4,0(s1)
    80008060:	0097b023          	sd	s1,0(a5)
    80008064:	00813483          	ld	s1,8(sp)
    80008068:	02010113          	addi	sp,sp,32
    8000806c:	00008067          	ret
    80008070:	00001517          	auipc	a0,0x1
    80008074:	5a050513          	addi	a0,a0,1440 # 80009610 <digits+0x18>
    80008078:	fffff097          	auipc	ra,0xfffff
    8000807c:	354080e7          	jalr	852(ra) # 800073cc <panic>

0000000080008080 <kalloc>:
    80008080:	fe010113          	addi	sp,sp,-32
    80008084:	00813823          	sd	s0,16(sp)
    80008088:	00913423          	sd	s1,8(sp)
    8000808c:	00113c23          	sd	ra,24(sp)
    80008090:	02010413          	addi	s0,sp,32
    80008094:	00003797          	auipc	a5,0x3
    80008098:	76c78793          	addi	a5,a5,1900 # 8000b800 <kmem>
    8000809c:	0007b483          	ld	s1,0(a5)
    800080a0:	02048063          	beqz	s1,800080c0 <kalloc+0x40>
    800080a4:	0004b703          	ld	a4,0(s1)
    800080a8:	00001637          	lui	a2,0x1
    800080ac:	00500593          	li	a1,5
    800080b0:	00048513          	mv	a0,s1
    800080b4:	00e7b023          	sd	a4,0(a5)
    800080b8:	00000097          	auipc	ra,0x0
    800080bc:	400080e7          	jalr	1024(ra) # 800084b8 <__memset>
    800080c0:	01813083          	ld	ra,24(sp)
    800080c4:	01013403          	ld	s0,16(sp)
    800080c8:	00048513          	mv	a0,s1
    800080cc:	00813483          	ld	s1,8(sp)
    800080d0:	02010113          	addi	sp,sp,32
    800080d4:	00008067          	ret

00000000800080d8 <initlock>:
    800080d8:	ff010113          	addi	sp,sp,-16
    800080dc:	00813423          	sd	s0,8(sp)
    800080e0:	01010413          	addi	s0,sp,16
    800080e4:	00813403          	ld	s0,8(sp)
    800080e8:	00b53423          	sd	a1,8(a0)
    800080ec:	00052023          	sw	zero,0(a0)
    800080f0:	00053823          	sd	zero,16(a0)
    800080f4:	01010113          	addi	sp,sp,16
    800080f8:	00008067          	ret

00000000800080fc <acquire>:
    800080fc:	fe010113          	addi	sp,sp,-32
    80008100:	00813823          	sd	s0,16(sp)
    80008104:	00913423          	sd	s1,8(sp)
    80008108:	00113c23          	sd	ra,24(sp)
    8000810c:	01213023          	sd	s2,0(sp)
    80008110:	02010413          	addi	s0,sp,32
    80008114:	00050493          	mv	s1,a0
    80008118:	10002973          	csrr	s2,sstatus
    8000811c:	100027f3          	csrr	a5,sstatus
    80008120:	ffd7f793          	andi	a5,a5,-3
    80008124:	10079073          	csrw	sstatus,a5
    80008128:	fffff097          	auipc	ra,0xfffff
    8000812c:	8e4080e7          	jalr	-1820(ra) # 80006a0c <mycpu>
    80008130:	07852783          	lw	a5,120(a0)
    80008134:	06078e63          	beqz	a5,800081b0 <acquire+0xb4>
    80008138:	fffff097          	auipc	ra,0xfffff
    8000813c:	8d4080e7          	jalr	-1836(ra) # 80006a0c <mycpu>
    80008140:	07852783          	lw	a5,120(a0)
    80008144:	0004a703          	lw	a4,0(s1)
    80008148:	0017879b          	addiw	a5,a5,1
    8000814c:	06f52c23          	sw	a5,120(a0)
    80008150:	04071063          	bnez	a4,80008190 <acquire+0x94>
    80008154:	00100713          	li	a4,1
    80008158:	00070793          	mv	a5,a4
    8000815c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80008160:	0007879b          	sext.w	a5,a5
    80008164:	fe079ae3          	bnez	a5,80008158 <acquire+0x5c>
    80008168:	0ff0000f          	fence
    8000816c:	fffff097          	auipc	ra,0xfffff
    80008170:	8a0080e7          	jalr	-1888(ra) # 80006a0c <mycpu>
    80008174:	01813083          	ld	ra,24(sp)
    80008178:	01013403          	ld	s0,16(sp)
    8000817c:	00a4b823          	sd	a0,16(s1)
    80008180:	00013903          	ld	s2,0(sp)
    80008184:	00813483          	ld	s1,8(sp)
    80008188:	02010113          	addi	sp,sp,32
    8000818c:	00008067          	ret
    80008190:	0104b903          	ld	s2,16(s1)
    80008194:	fffff097          	auipc	ra,0xfffff
    80008198:	878080e7          	jalr	-1928(ra) # 80006a0c <mycpu>
    8000819c:	faa91ce3          	bne	s2,a0,80008154 <acquire+0x58>
    800081a0:	00001517          	auipc	a0,0x1
    800081a4:	47850513          	addi	a0,a0,1144 # 80009618 <digits+0x20>
    800081a8:	fffff097          	auipc	ra,0xfffff
    800081ac:	224080e7          	jalr	548(ra) # 800073cc <panic>
    800081b0:	00195913          	srli	s2,s2,0x1
    800081b4:	fffff097          	auipc	ra,0xfffff
    800081b8:	858080e7          	jalr	-1960(ra) # 80006a0c <mycpu>
    800081bc:	00197913          	andi	s2,s2,1
    800081c0:	07252e23          	sw	s2,124(a0)
    800081c4:	f75ff06f          	j	80008138 <acquire+0x3c>

00000000800081c8 <release>:
    800081c8:	fe010113          	addi	sp,sp,-32
    800081cc:	00813823          	sd	s0,16(sp)
    800081d0:	00113c23          	sd	ra,24(sp)
    800081d4:	00913423          	sd	s1,8(sp)
    800081d8:	01213023          	sd	s2,0(sp)
    800081dc:	02010413          	addi	s0,sp,32
    800081e0:	00052783          	lw	a5,0(a0)
    800081e4:	00079a63          	bnez	a5,800081f8 <release+0x30>
    800081e8:	00001517          	auipc	a0,0x1
    800081ec:	43850513          	addi	a0,a0,1080 # 80009620 <digits+0x28>
    800081f0:	fffff097          	auipc	ra,0xfffff
    800081f4:	1dc080e7          	jalr	476(ra) # 800073cc <panic>
    800081f8:	01053903          	ld	s2,16(a0)
    800081fc:	00050493          	mv	s1,a0
    80008200:	fffff097          	auipc	ra,0xfffff
    80008204:	80c080e7          	jalr	-2036(ra) # 80006a0c <mycpu>
    80008208:	fea910e3          	bne	s2,a0,800081e8 <release+0x20>
    8000820c:	0004b823          	sd	zero,16(s1)
    80008210:	0ff0000f          	fence
    80008214:	0f50000f          	fence	iorw,ow
    80008218:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000821c:	ffffe097          	auipc	ra,0xffffe
    80008220:	7f0080e7          	jalr	2032(ra) # 80006a0c <mycpu>
    80008224:	100027f3          	csrr	a5,sstatus
    80008228:	0027f793          	andi	a5,a5,2
    8000822c:	04079a63          	bnez	a5,80008280 <release+0xb8>
    80008230:	07852783          	lw	a5,120(a0)
    80008234:	02f05e63          	blez	a5,80008270 <release+0xa8>
    80008238:	fff7871b          	addiw	a4,a5,-1
    8000823c:	06e52c23          	sw	a4,120(a0)
    80008240:	00071c63          	bnez	a4,80008258 <release+0x90>
    80008244:	07c52783          	lw	a5,124(a0)
    80008248:	00078863          	beqz	a5,80008258 <release+0x90>
    8000824c:	100027f3          	csrr	a5,sstatus
    80008250:	0027e793          	ori	a5,a5,2
    80008254:	10079073          	csrw	sstatus,a5
    80008258:	01813083          	ld	ra,24(sp)
    8000825c:	01013403          	ld	s0,16(sp)
    80008260:	00813483          	ld	s1,8(sp)
    80008264:	00013903          	ld	s2,0(sp)
    80008268:	02010113          	addi	sp,sp,32
    8000826c:	00008067          	ret
    80008270:	00001517          	auipc	a0,0x1
    80008274:	3d050513          	addi	a0,a0,976 # 80009640 <digits+0x48>
    80008278:	fffff097          	auipc	ra,0xfffff
    8000827c:	154080e7          	jalr	340(ra) # 800073cc <panic>
    80008280:	00001517          	auipc	a0,0x1
    80008284:	3a850513          	addi	a0,a0,936 # 80009628 <digits+0x30>
    80008288:	fffff097          	auipc	ra,0xfffff
    8000828c:	144080e7          	jalr	324(ra) # 800073cc <panic>

0000000080008290 <holding>:
    80008290:	00052783          	lw	a5,0(a0)
    80008294:	00079663          	bnez	a5,800082a0 <holding+0x10>
    80008298:	00000513          	li	a0,0
    8000829c:	00008067          	ret
    800082a0:	fe010113          	addi	sp,sp,-32
    800082a4:	00813823          	sd	s0,16(sp)
    800082a8:	00913423          	sd	s1,8(sp)
    800082ac:	00113c23          	sd	ra,24(sp)
    800082b0:	02010413          	addi	s0,sp,32
    800082b4:	01053483          	ld	s1,16(a0)
    800082b8:	ffffe097          	auipc	ra,0xffffe
    800082bc:	754080e7          	jalr	1876(ra) # 80006a0c <mycpu>
    800082c0:	01813083          	ld	ra,24(sp)
    800082c4:	01013403          	ld	s0,16(sp)
    800082c8:	40a48533          	sub	a0,s1,a0
    800082cc:	00153513          	seqz	a0,a0
    800082d0:	00813483          	ld	s1,8(sp)
    800082d4:	02010113          	addi	sp,sp,32
    800082d8:	00008067          	ret

00000000800082dc <push_off>:
    800082dc:	fe010113          	addi	sp,sp,-32
    800082e0:	00813823          	sd	s0,16(sp)
    800082e4:	00113c23          	sd	ra,24(sp)
    800082e8:	00913423          	sd	s1,8(sp)
    800082ec:	02010413          	addi	s0,sp,32
    800082f0:	100024f3          	csrr	s1,sstatus
    800082f4:	100027f3          	csrr	a5,sstatus
    800082f8:	ffd7f793          	andi	a5,a5,-3
    800082fc:	10079073          	csrw	sstatus,a5
    80008300:	ffffe097          	auipc	ra,0xffffe
    80008304:	70c080e7          	jalr	1804(ra) # 80006a0c <mycpu>
    80008308:	07852783          	lw	a5,120(a0)
    8000830c:	02078663          	beqz	a5,80008338 <push_off+0x5c>
    80008310:	ffffe097          	auipc	ra,0xffffe
    80008314:	6fc080e7          	jalr	1788(ra) # 80006a0c <mycpu>
    80008318:	07852783          	lw	a5,120(a0)
    8000831c:	01813083          	ld	ra,24(sp)
    80008320:	01013403          	ld	s0,16(sp)
    80008324:	0017879b          	addiw	a5,a5,1
    80008328:	06f52c23          	sw	a5,120(a0)
    8000832c:	00813483          	ld	s1,8(sp)
    80008330:	02010113          	addi	sp,sp,32
    80008334:	00008067          	ret
    80008338:	0014d493          	srli	s1,s1,0x1
    8000833c:	ffffe097          	auipc	ra,0xffffe
    80008340:	6d0080e7          	jalr	1744(ra) # 80006a0c <mycpu>
    80008344:	0014f493          	andi	s1,s1,1
    80008348:	06952e23          	sw	s1,124(a0)
    8000834c:	fc5ff06f          	j	80008310 <push_off+0x34>

0000000080008350 <pop_off>:
    80008350:	ff010113          	addi	sp,sp,-16
    80008354:	00813023          	sd	s0,0(sp)
    80008358:	00113423          	sd	ra,8(sp)
    8000835c:	01010413          	addi	s0,sp,16
    80008360:	ffffe097          	auipc	ra,0xffffe
    80008364:	6ac080e7          	jalr	1708(ra) # 80006a0c <mycpu>
    80008368:	100027f3          	csrr	a5,sstatus
    8000836c:	0027f793          	andi	a5,a5,2
    80008370:	04079663          	bnez	a5,800083bc <pop_off+0x6c>
    80008374:	07852783          	lw	a5,120(a0)
    80008378:	02f05a63          	blez	a5,800083ac <pop_off+0x5c>
    8000837c:	fff7871b          	addiw	a4,a5,-1
    80008380:	06e52c23          	sw	a4,120(a0)
    80008384:	00071c63          	bnez	a4,8000839c <pop_off+0x4c>
    80008388:	07c52783          	lw	a5,124(a0)
    8000838c:	00078863          	beqz	a5,8000839c <pop_off+0x4c>
    80008390:	100027f3          	csrr	a5,sstatus
    80008394:	0027e793          	ori	a5,a5,2
    80008398:	10079073          	csrw	sstatus,a5
    8000839c:	00813083          	ld	ra,8(sp)
    800083a0:	00013403          	ld	s0,0(sp)
    800083a4:	01010113          	addi	sp,sp,16
    800083a8:	00008067          	ret
    800083ac:	00001517          	auipc	a0,0x1
    800083b0:	29450513          	addi	a0,a0,660 # 80009640 <digits+0x48>
    800083b4:	fffff097          	auipc	ra,0xfffff
    800083b8:	018080e7          	jalr	24(ra) # 800073cc <panic>
    800083bc:	00001517          	auipc	a0,0x1
    800083c0:	26c50513          	addi	a0,a0,620 # 80009628 <digits+0x30>
    800083c4:	fffff097          	auipc	ra,0xfffff
    800083c8:	008080e7          	jalr	8(ra) # 800073cc <panic>

00000000800083cc <push_on>:
    800083cc:	fe010113          	addi	sp,sp,-32
    800083d0:	00813823          	sd	s0,16(sp)
    800083d4:	00113c23          	sd	ra,24(sp)
    800083d8:	00913423          	sd	s1,8(sp)
    800083dc:	02010413          	addi	s0,sp,32
    800083e0:	100024f3          	csrr	s1,sstatus
    800083e4:	100027f3          	csrr	a5,sstatus
    800083e8:	0027e793          	ori	a5,a5,2
    800083ec:	10079073          	csrw	sstatus,a5
    800083f0:	ffffe097          	auipc	ra,0xffffe
    800083f4:	61c080e7          	jalr	1564(ra) # 80006a0c <mycpu>
    800083f8:	07852783          	lw	a5,120(a0)
    800083fc:	02078663          	beqz	a5,80008428 <push_on+0x5c>
    80008400:	ffffe097          	auipc	ra,0xffffe
    80008404:	60c080e7          	jalr	1548(ra) # 80006a0c <mycpu>
    80008408:	07852783          	lw	a5,120(a0)
    8000840c:	01813083          	ld	ra,24(sp)
    80008410:	01013403          	ld	s0,16(sp)
    80008414:	0017879b          	addiw	a5,a5,1
    80008418:	06f52c23          	sw	a5,120(a0)
    8000841c:	00813483          	ld	s1,8(sp)
    80008420:	02010113          	addi	sp,sp,32
    80008424:	00008067          	ret
    80008428:	0014d493          	srli	s1,s1,0x1
    8000842c:	ffffe097          	auipc	ra,0xffffe
    80008430:	5e0080e7          	jalr	1504(ra) # 80006a0c <mycpu>
    80008434:	0014f493          	andi	s1,s1,1
    80008438:	06952e23          	sw	s1,124(a0)
    8000843c:	fc5ff06f          	j	80008400 <push_on+0x34>

0000000080008440 <pop_on>:
    80008440:	ff010113          	addi	sp,sp,-16
    80008444:	00813023          	sd	s0,0(sp)
    80008448:	00113423          	sd	ra,8(sp)
    8000844c:	01010413          	addi	s0,sp,16
    80008450:	ffffe097          	auipc	ra,0xffffe
    80008454:	5bc080e7          	jalr	1468(ra) # 80006a0c <mycpu>
    80008458:	100027f3          	csrr	a5,sstatus
    8000845c:	0027f793          	andi	a5,a5,2
    80008460:	04078463          	beqz	a5,800084a8 <pop_on+0x68>
    80008464:	07852783          	lw	a5,120(a0)
    80008468:	02f05863          	blez	a5,80008498 <pop_on+0x58>
    8000846c:	fff7879b          	addiw	a5,a5,-1
    80008470:	06f52c23          	sw	a5,120(a0)
    80008474:	07853783          	ld	a5,120(a0)
    80008478:	00079863          	bnez	a5,80008488 <pop_on+0x48>
    8000847c:	100027f3          	csrr	a5,sstatus
    80008480:	ffd7f793          	andi	a5,a5,-3
    80008484:	10079073          	csrw	sstatus,a5
    80008488:	00813083          	ld	ra,8(sp)
    8000848c:	00013403          	ld	s0,0(sp)
    80008490:	01010113          	addi	sp,sp,16
    80008494:	00008067          	ret
    80008498:	00001517          	auipc	a0,0x1
    8000849c:	1d050513          	addi	a0,a0,464 # 80009668 <digits+0x70>
    800084a0:	fffff097          	auipc	ra,0xfffff
    800084a4:	f2c080e7          	jalr	-212(ra) # 800073cc <panic>
    800084a8:	00001517          	auipc	a0,0x1
    800084ac:	1a050513          	addi	a0,a0,416 # 80009648 <digits+0x50>
    800084b0:	fffff097          	auipc	ra,0xfffff
    800084b4:	f1c080e7          	jalr	-228(ra) # 800073cc <panic>

00000000800084b8 <__memset>:
    800084b8:	ff010113          	addi	sp,sp,-16
    800084bc:	00813423          	sd	s0,8(sp)
    800084c0:	01010413          	addi	s0,sp,16
    800084c4:	1a060e63          	beqz	a2,80008680 <__memset+0x1c8>
    800084c8:	40a007b3          	neg	a5,a0
    800084cc:	0077f793          	andi	a5,a5,7
    800084d0:	00778693          	addi	a3,a5,7
    800084d4:	00b00813          	li	a6,11
    800084d8:	0ff5f593          	andi	a1,a1,255
    800084dc:	fff6071b          	addiw	a4,a2,-1
    800084e0:	1b06e663          	bltu	a3,a6,8000868c <__memset+0x1d4>
    800084e4:	1cd76463          	bltu	a4,a3,800086ac <__memset+0x1f4>
    800084e8:	1a078e63          	beqz	a5,800086a4 <__memset+0x1ec>
    800084ec:	00b50023          	sb	a1,0(a0)
    800084f0:	00100713          	li	a4,1
    800084f4:	1ae78463          	beq	a5,a4,8000869c <__memset+0x1e4>
    800084f8:	00b500a3          	sb	a1,1(a0)
    800084fc:	00200713          	li	a4,2
    80008500:	1ae78a63          	beq	a5,a4,800086b4 <__memset+0x1fc>
    80008504:	00b50123          	sb	a1,2(a0)
    80008508:	00300713          	li	a4,3
    8000850c:	18e78463          	beq	a5,a4,80008694 <__memset+0x1dc>
    80008510:	00b501a3          	sb	a1,3(a0)
    80008514:	00400713          	li	a4,4
    80008518:	1ae78263          	beq	a5,a4,800086bc <__memset+0x204>
    8000851c:	00b50223          	sb	a1,4(a0)
    80008520:	00500713          	li	a4,5
    80008524:	1ae78063          	beq	a5,a4,800086c4 <__memset+0x20c>
    80008528:	00b502a3          	sb	a1,5(a0)
    8000852c:	00700713          	li	a4,7
    80008530:	18e79e63          	bne	a5,a4,800086cc <__memset+0x214>
    80008534:	00b50323          	sb	a1,6(a0)
    80008538:	00700e93          	li	t4,7
    8000853c:	00859713          	slli	a4,a1,0x8
    80008540:	00e5e733          	or	a4,a1,a4
    80008544:	01059e13          	slli	t3,a1,0x10
    80008548:	01c76e33          	or	t3,a4,t3
    8000854c:	01859313          	slli	t1,a1,0x18
    80008550:	006e6333          	or	t1,t3,t1
    80008554:	02059893          	slli	a7,a1,0x20
    80008558:	40f60e3b          	subw	t3,a2,a5
    8000855c:	011368b3          	or	a7,t1,a7
    80008560:	02859813          	slli	a6,a1,0x28
    80008564:	0108e833          	or	a6,a7,a6
    80008568:	03059693          	slli	a3,a1,0x30
    8000856c:	003e589b          	srliw	a7,t3,0x3
    80008570:	00d866b3          	or	a3,a6,a3
    80008574:	03859713          	slli	a4,a1,0x38
    80008578:	00389813          	slli	a6,a7,0x3
    8000857c:	00f507b3          	add	a5,a0,a5
    80008580:	00e6e733          	or	a4,a3,a4
    80008584:	000e089b          	sext.w	a7,t3
    80008588:	00f806b3          	add	a3,a6,a5
    8000858c:	00e7b023          	sd	a4,0(a5)
    80008590:	00878793          	addi	a5,a5,8
    80008594:	fed79ce3          	bne	a5,a3,8000858c <__memset+0xd4>
    80008598:	ff8e7793          	andi	a5,t3,-8
    8000859c:	0007871b          	sext.w	a4,a5
    800085a0:	01d787bb          	addw	a5,a5,t4
    800085a4:	0ce88e63          	beq	a7,a4,80008680 <__memset+0x1c8>
    800085a8:	00f50733          	add	a4,a0,a5
    800085ac:	00b70023          	sb	a1,0(a4)
    800085b0:	0017871b          	addiw	a4,a5,1
    800085b4:	0cc77663          	bgeu	a4,a2,80008680 <__memset+0x1c8>
    800085b8:	00e50733          	add	a4,a0,a4
    800085bc:	00b70023          	sb	a1,0(a4)
    800085c0:	0027871b          	addiw	a4,a5,2
    800085c4:	0ac77e63          	bgeu	a4,a2,80008680 <__memset+0x1c8>
    800085c8:	00e50733          	add	a4,a0,a4
    800085cc:	00b70023          	sb	a1,0(a4)
    800085d0:	0037871b          	addiw	a4,a5,3
    800085d4:	0ac77663          	bgeu	a4,a2,80008680 <__memset+0x1c8>
    800085d8:	00e50733          	add	a4,a0,a4
    800085dc:	00b70023          	sb	a1,0(a4)
    800085e0:	0047871b          	addiw	a4,a5,4
    800085e4:	08c77e63          	bgeu	a4,a2,80008680 <__memset+0x1c8>
    800085e8:	00e50733          	add	a4,a0,a4
    800085ec:	00b70023          	sb	a1,0(a4)
    800085f0:	0057871b          	addiw	a4,a5,5
    800085f4:	08c77663          	bgeu	a4,a2,80008680 <__memset+0x1c8>
    800085f8:	00e50733          	add	a4,a0,a4
    800085fc:	00b70023          	sb	a1,0(a4)
    80008600:	0067871b          	addiw	a4,a5,6
    80008604:	06c77e63          	bgeu	a4,a2,80008680 <__memset+0x1c8>
    80008608:	00e50733          	add	a4,a0,a4
    8000860c:	00b70023          	sb	a1,0(a4)
    80008610:	0077871b          	addiw	a4,a5,7
    80008614:	06c77663          	bgeu	a4,a2,80008680 <__memset+0x1c8>
    80008618:	00e50733          	add	a4,a0,a4
    8000861c:	00b70023          	sb	a1,0(a4)
    80008620:	0087871b          	addiw	a4,a5,8
    80008624:	04c77e63          	bgeu	a4,a2,80008680 <__memset+0x1c8>
    80008628:	00e50733          	add	a4,a0,a4
    8000862c:	00b70023          	sb	a1,0(a4)
    80008630:	0097871b          	addiw	a4,a5,9
    80008634:	04c77663          	bgeu	a4,a2,80008680 <__memset+0x1c8>
    80008638:	00e50733          	add	a4,a0,a4
    8000863c:	00b70023          	sb	a1,0(a4)
    80008640:	00a7871b          	addiw	a4,a5,10
    80008644:	02c77e63          	bgeu	a4,a2,80008680 <__memset+0x1c8>
    80008648:	00e50733          	add	a4,a0,a4
    8000864c:	00b70023          	sb	a1,0(a4)
    80008650:	00b7871b          	addiw	a4,a5,11
    80008654:	02c77663          	bgeu	a4,a2,80008680 <__memset+0x1c8>
    80008658:	00e50733          	add	a4,a0,a4
    8000865c:	00b70023          	sb	a1,0(a4)
    80008660:	00c7871b          	addiw	a4,a5,12
    80008664:	00c77e63          	bgeu	a4,a2,80008680 <__memset+0x1c8>
    80008668:	00e50733          	add	a4,a0,a4
    8000866c:	00b70023          	sb	a1,0(a4)
    80008670:	00d7879b          	addiw	a5,a5,13
    80008674:	00c7f663          	bgeu	a5,a2,80008680 <__memset+0x1c8>
    80008678:	00f507b3          	add	a5,a0,a5
    8000867c:	00b78023          	sb	a1,0(a5)
    80008680:	00813403          	ld	s0,8(sp)
    80008684:	01010113          	addi	sp,sp,16
    80008688:	00008067          	ret
    8000868c:	00b00693          	li	a3,11
    80008690:	e55ff06f          	j	800084e4 <__memset+0x2c>
    80008694:	00300e93          	li	t4,3
    80008698:	ea5ff06f          	j	8000853c <__memset+0x84>
    8000869c:	00100e93          	li	t4,1
    800086a0:	e9dff06f          	j	8000853c <__memset+0x84>
    800086a4:	00000e93          	li	t4,0
    800086a8:	e95ff06f          	j	8000853c <__memset+0x84>
    800086ac:	00000793          	li	a5,0
    800086b0:	ef9ff06f          	j	800085a8 <__memset+0xf0>
    800086b4:	00200e93          	li	t4,2
    800086b8:	e85ff06f          	j	8000853c <__memset+0x84>
    800086bc:	00400e93          	li	t4,4
    800086c0:	e7dff06f          	j	8000853c <__memset+0x84>
    800086c4:	00500e93          	li	t4,5
    800086c8:	e75ff06f          	j	8000853c <__memset+0x84>
    800086cc:	00600e93          	li	t4,6
    800086d0:	e6dff06f          	j	8000853c <__memset+0x84>

00000000800086d4 <__memmove>:
    800086d4:	ff010113          	addi	sp,sp,-16
    800086d8:	00813423          	sd	s0,8(sp)
    800086dc:	01010413          	addi	s0,sp,16
    800086e0:	0e060863          	beqz	a2,800087d0 <__memmove+0xfc>
    800086e4:	fff6069b          	addiw	a3,a2,-1
    800086e8:	0006881b          	sext.w	a6,a3
    800086ec:	0ea5e863          	bltu	a1,a0,800087dc <__memmove+0x108>
    800086f0:	00758713          	addi	a4,a1,7
    800086f4:	00a5e7b3          	or	a5,a1,a0
    800086f8:	40a70733          	sub	a4,a4,a0
    800086fc:	0077f793          	andi	a5,a5,7
    80008700:	00f73713          	sltiu	a4,a4,15
    80008704:	00174713          	xori	a4,a4,1
    80008708:	0017b793          	seqz	a5,a5
    8000870c:	00e7f7b3          	and	a5,a5,a4
    80008710:	10078863          	beqz	a5,80008820 <__memmove+0x14c>
    80008714:	00900793          	li	a5,9
    80008718:	1107f463          	bgeu	a5,a6,80008820 <__memmove+0x14c>
    8000871c:	0036581b          	srliw	a6,a2,0x3
    80008720:	fff8081b          	addiw	a6,a6,-1
    80008724:	02081813          	slli	a6,a6,0x20
    80008728:	01d85893          	srli	a7,a6,0x1d
    8000872c:	00858813          	addi	a6,a1,8
    80008730:	00058793          	mv	a5,a1
    80008734:	00050713          	mv	a4,a0
    80008738:	01088833          	add	a6,a7,a6
    8000873c:	0007b883          	ld	a7,0(a5)
    80008740:	00878793          	addi	a5,a5,8
    80008744:	00870713          	addi	a4,a4,8
    80008748:	ff173c23          	sd	a7,-8(a4)
    8000874c:	ff0798e3          	bne	a5,a6,8000873c <__memmove+0x68>
    80008750:	ff867713          	andi	a4,a2,-8
    80008754:	02071793          	slli	a5,a4,0x20
    80008758:	0207d793          	srli	a5,a5,0x20
    8000875c:	00f585b3          	add	a1,a1,a5
    80008760:	40e686bb          	subw	a3,a3,a4
    80008764:	00f507b3          	add	a5,a0,a5
    80008768:	06e60463          	beq	a2,a4,800087d0 <__memmove+0xfc>
    8000876c:	0005c703          	lbu	a4,0(a1)
    80008770:	00e78023          	sb	a4,0(a5)
    80008774:	04068e63          	beqz	a3,800087d0 <__memmove+0xfc>
    80008778:	0015c603          	lbu	a2,1(a1)
    8000877c:	00100713          	li	a4,1
    80008780:	00c780a3          	sb	a2,1(a5)
    80008784:	04e68663          	beq	a3,a4,800087d0 <__memmove+0xfc>
    80008788:	0025c603          	lbu	a2,2(a1)
    8000878c:	00200713          	li	a4,2
    80008790:	00c78123          	sb	a2,2(a5)
    80008794:	02e68e63          	beq	a3,a4,800087d0 <__memmove+0xfc>
    80008798:	0035c603          	lbu	a2,3(a1)
    8000879c:	00300713          	li	a4,3
    800087a0:	00c781a3          	sb	a2,3(a5)
    800087a4:	02e68663          	beq	a3,a4,800087d0 <__memmove+0xfc>
    800087a8:	0045c603          	lbu	a2,4(a1)
    800087ac:	00400713          	li	a4,4
    800087b0:	00c78223          	sb	a2,4(a5)
    800087b4:	00e68e63          	beq	a3,a4,800087d0 <__memmove+0xfc>
    800087b8:	0055c603          	lbu	a2,5(a1)
    800087bc:	00500713          	li	a4,5
    800087c0:	00c782a3          	sb	a2,5(a5)
    800087c4:	00e68663          	beq	a3,a4,800087d0 <__memmove+0xfc>
    800087c8:	0065c703          	lbu	a4,6(a1)
    800087cc:	00e78323          	sb	a4,6(a5)
    800087d0:	00813403          	ld	s0,8(sp)
    800087d4:	01010113          	addi	sp,sp,16
    800087d8:	00008067          	ret
    800087dc:	02061713          	slli	a4,a2,0x20
    800087e0:	02075713          	srli	a4,a4,0x20
    800087e4:	00e587b3          	add	a5,a1,a4
    800087e8:	f0f574e3          	bgeu	a0,a5,800086f0 <__memmove+0x1c>
    800087ec:	02069613          	slli	a2,a3,0x20
    800087f0:	02065613          	srli	a2,a2,0x20
    800087f4:	fff64613          	not	a2,a2
    800087f8:	00e50733          	add	a4,a0,a4
    800087fc:	00c78633          	add	a2,a5,a2
    80008800:	fff7c683          	lbu	a3,-1(a5)
    80008804:	fff78793          	addi	a5,a5,-1
    80008808:	fff70713          	addi	a4,a4,-1
    8000880c:	00d70023          	sb	a3,0(a4)
    80008810:	fec798e3          	bne	a5,a2,80008800 <__memmove+0x12c>
    80008814:	00813403          	ld	s0,8(sp)
    80008818:	01010113          	addi	sp,sp,16
    8000881c:	00008067          	ret
    80008820:	02069713          	slli	a4,a3,0x20
    80008824:	02075713          	srli	a4,a4,0x20
    80008828:	00170713          	addi	a4,a4,1
    8000882c:	00e50733          	add	a4,a0,a4
    80008830:	00050793          	mv	a5,a0
    80008834:	0005c683          	lbu	a3,0(a1)
    80008838:	00178793          	addi	a5,a5,1
    8000883c:	00158593          	addi	a1,a1,1
    80008840:	fed78fa3          	sb	a3,-1(a5)
    80008844:	fee798e3          	bne	a5,a4,80008834 <__memmove+0x160>
    80008848:	f89ff06f          	j	800087d0 <__memmove+0xfc>
	...
