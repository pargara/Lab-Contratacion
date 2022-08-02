require "test_helper"

class ContractorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contractor = contractors(:one)
  end

  test "should get index" do
    get contractors_url
    assert_response :success
  end

  test "should get new" do
    get new_contractor_url
    assert_response :success
  end

  test "should create contractor" do
    assert_difference("Contractor.count") do
      post contractors_url, params: { contractor: { apellido: @contractor.apellido, cedula_contratista: @contractor.cedula_contratista, edad: @contractor.edad, fecha_de_nacimiento: @contractor.fecha_de_nacimiento, fecha_expedicion_cedula: @contractor.fecha_expedicion_cedula, lugar_expedicion_cedula: @contractor.lugar_expedicion_cedula, municipio_de_recidencia: @contractor.municipio_de_recidencia, nombre: @contractor.nombre, numero_de_libreta_militar: @contractor.numero_de_libreta_militar, sexo: @contractor.sexo } }
    end

    assert_redirected_to contractor_url(Contractor.last)
  end

  test "should show contractor" do
    get contractor_url(@contractor)
    assert_response :success
  end

  test "should get edit" do
    get edit_contractor_url(@contractor)
    assert_response :success
  end

  test "should update contractor" do
    patch contractor_url(@contractor), params: { contractor: { apellido: @contractor.apellido, cedula_contratista: @contractor.cedula_contratista, edad: @contractor.edad, fecha_de_nacimiento: @contractor.fecha_de_nacimiento, fecha_expedicion_cedula: @contractor.fecha_expedicion_cedula, lugar_expedicion_cedula: @contractor.lugar_expedicion_cedula, municipio_de_recidencia: @contractor.municipio_de_recidencia, nombre: @contractor.nombre, numero_de_libreta_militar: @contractor.numero_de_libreta_militar, sexo: @contractor.sexo } }
    assert_redirected_to contractor_url(@contractor)
  end

  test "should destroy contractor" do
    assert_difference("Contractor.count", -1) do
      delete contractor_url(@contractor)
    end

    assert_redirected_to contractors_url
  end
end
