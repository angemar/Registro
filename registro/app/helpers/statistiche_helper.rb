module StatisticheHelper
def assenze_stat
    column_chart @assenze.group("strftime('%Y',date)").group("strftime('%m',date)").count, height: '500px', width: "800px",ytitle: "Numero Assenze", xtitle: "Mese"
  end

def voti_val
    arr=@voti.select("materia_id").distinct.map(&:materia_id)
    v=arr.collect { |v|  @voti.where(materia_id: v).sum('valore')/@voti.where(materia_id: v).count} 
    series=[]
    i=0
    until i >= arr.length  do
       series.push([Materia.find(arr[i]).nome, v[i]])
       i=i+1;
    end
    series 
end

def voti_stat
    column_chart voti_val, height: '500px', width: "800px",ytitle: "Media", xtitle: "Materia"
  end


end

